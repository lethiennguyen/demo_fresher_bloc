import 'package:demo_fresher_bloc/core/base/widget_base/base_get_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.src.dart';
import '../../lib.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_event.dart';
import 'bloc/app_state.dart';

class SplashPage extends BaseGetPage<AppBloc> {
  const SplashPage({super.key});

  @override
  void onInit(BuildContext context, AppBloc bloc) {
    bloc.add(AppStarted());
  }

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          if (state is Authenticated) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouter.routerHome,
              (route) => false,
            );
          } else if (state is Unauthenticated) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRouter.routerLogin, // ✅ nhớ route login
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          return const Center(
            child: TextUtils(
              text: "DEMO",
              availableStyle: StyleEnum.t28Bold,
              color: AppColors.mainColors,
            ),
          );
        },
      ),
    );
  }
}
