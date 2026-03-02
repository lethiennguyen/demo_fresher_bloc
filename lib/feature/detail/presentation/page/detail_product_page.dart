import 'package:demo_fresher_bloc/feature/detail/presentation/bloc/controller.src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/widget_base/base_get_page.dart';
import '../../../../core/values/app_string.dart';
import '../../../../lib.dart';
import '../bloc/detail_product_event.dart';
import '../bloc/detail_product_state.dart';

part 'detail_product_widget.dart';
// part 'update_product_wiget.dart';

class DetailProductPage extends BaseGetPage<DetailProductBloc> {
  const DetailProductPage({super.key});

  @override
  void onInit(BuildContext context, DetailProductBloc bloc) {
    bloc.add(DetailProductStarted());
  }

  @override
  Widget buildPage(BuildContext context) {
    return BlocListener<DetailProductBloc, DetailProductState>(
      listener: (context, state) {},
      child: BlocBuilder<DetailProductBloc, DetailProductState>(
          builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.basicWhite,
            appBar: UtilWidget.buildAppBar(
              context,
              "Chi tiết",
              centerTitle: true,
              backButtonColor: AppColors.basicBlack,
              textColor: AppColors.mainColors,
              // funcLeading: controller.onBack,
            ),
            body: buildProductDetailBody(state),
            bottomNavigationBar: buildBottomBarDetail(state));
      }),
    );
  }
}
