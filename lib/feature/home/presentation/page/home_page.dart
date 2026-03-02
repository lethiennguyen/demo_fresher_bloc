import 'package:demo_fresher_bloc/feature/home/presentation/bloc/controller.src.dart';
import 'package:demo_fresher_bloc/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/core.src.dart';
import '../../../../core/values/app_string.dart';
import '../../../../lib.dart';
import '../../../../shared/widgets/input_form/input.src.dart';
import '../../../../shared/widgets/show_popup.dart';
import '../../domain/domain.src.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../component/filter_list_product.dart';
import '../component/skeleton.dart';

part 'home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc get bloc => sl<HomeBloc>();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    context.read<HomeBloc>().add(HomeStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.message != null) {
          UtilWidget.showSnackBar(
            title: LocaleKeys.notification_title,
            message: state.message!,
          );
          bloc.add(const HomeMessageConsumed());
        }
        if (state.didLogout) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRouter.routerLogin, (a) => true);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.colorWhite,
          appBar: UtilWidget.buildAppBar(
            context,
            "Danh sách",
            textColor: AppColors.mainColors,
            showBackButton: false,
            actions: [
              buildIconButton(() {
                UtilWidget.showConfirmDialog(
                  context,
                  title: LocaleKeys.menu_logout,
                  subtitle: LocaleKeys.menu_contentLogout,
                  typeAction: AppConst.actionNotification,
                  onCancel: () => Navigator.pop(context),
                  onConfirm: () {
                    context.read<HomeBloc>().add(const HomeLogoutRequested());
                  },
                );
              }, icon: Icons.login_outlined, isIcon: true),
            ],
          ),
          body: _buildHomeBody(context, bloc),
          floatingActionButton: buildFloatingActionButton(context),
        );
      },
    );
  }
}
