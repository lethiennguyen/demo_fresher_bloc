import 'package:demo_fresher_bloc/feature/detail/presentation/bloc/controller.src.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/core.src.dart';
import '../../../../core/values/app_string.dart';
import '../../../../lib.dart';
import '../../../../shared/widgets/input_form/input.src.dart';
import '../../../../shared/widgets/show_popup.dart';
import '../bloc/detail_product_event.dart';
import '../bloc/detail_product_state.dart';
import '../component/component.src.dart';

part 'detail_product_widget.dart';
part 'update_product_wiget.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late final DetailProductBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<DetailProductBloc>();
    bloc.add(DetailStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailProductBloc>.value(
        value: bloc,
        child: MultiBlocListener(
          listeners: [
            BlocListener<DetailProductBloc, DetailProductState>(
              listenWhen: (p, c) => p.createSuccess != c.createSuccess,
              listener: (context, state) {
                if (state.createSuccess) {
                  Navigator.pop(context);
                }
              },
            ),
            BlocListener<DetailProductBloc, DetailProductState>(
              listenWhen: (p, c) => p.errorMessage != c.errorMessage,
              listener: (context, state) {
                if (state.errorMessage != null) {
                  ShowPopup.showErrorMessage(context, state.errorMessage!);
                }
              },
            ),
            BlocListener<DetailProductBloc, DetailProductState>(
              listenWhen: (p, c) => p.messageId != c.messageId,
              listener: (context, state) {
                if (state.message != null) {
                  UtilWidget.showSnackBar(
                    context: context,
                    title: LocaleKeys.notification_title,
                    message: state.message!,
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<DetailProductBloc, DetailProductState>(
            builder: (context, state) =>
                buildOverLoading(context, context.read<DetailProductBloc>()),
          ),
        ));
  }

  Widget buildFromBody(BuildContext context, DetailProductBloc bloc) {
    return Scaffold(
      backgroundColor: AppColors.basicWhite,
      appBar: UtilWidget.buildAppBar(
        context,
        bloc.title,
        centerTitle: true,
        backButtonColor: AppColors.basicBlack,
        textColor: AppColors.mainColors,
        funcLeading: () {
          bloc.add(OnBack());
        },
      ),
      body: bloc.state.isDetail
          ? buildProductDetailBody(bloc)
          : _buildBody(context, bloc),
      bottomNavigationBar: bloc.state.isDetail
          ? buildBottomBarDetail(context, bloc)
          : buildBottomBar(bloc),
    );
  }

  Widget buildOverLoading(BuildContext context, DetailProductBloc bloc) {
    final screenPadding = MediaQuery.paddingOf(context);
    final appBarHeight = screenPadding.top + kToolbarHeight;
    return Stack(
      children: [
        buildFromBody(context, bloc),
        if (bloc.state.isOverlayLoading)
          Stack(
            children: [
              // Container này sẽ chiếm full màn hình và chặn sự kiện tap
              // Nhưng sẽ có xử lý thêm margin ở trên và dưới để cho phép tap vào appBar và bottom banner ad
              GestureDetector(
                onTap: () {
                  // Nếu đang mở bàn phím thì user có thể bấm vào cái loading này để ẩn bàn phím đi
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  /// Chiều cao của appBar
                  margin: EdgeInsets.only(
                    top: appBarHeight,
                  ),
                  color: Colors.transparent,
                ),
              ),
              // Cái overlay này sẽ không chặn sự kiện tap, tức là chỉ hiển thị,
              // user vẫn bấm được vào cá widget bên dưới nó bình thường, cái Container bên trên mới là cái chặn sự kiện tap
              IgnorePointer(
                ignoring: true,
                child: Container(
                  color: AppColors.colorBlack38,
                  child: Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                      size: AppDimens.sizeIconLoadingOver,
                      color: AppColors.primaryCam1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        const SizedBox.shrink(),
      ],
    );
  }
}
