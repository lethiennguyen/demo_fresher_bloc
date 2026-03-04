import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/core.src.dart';
import '../../../../core/values/app_string.dart';
import '../../../../lib.dart';
import '../../../../shared/widgets/show_popup.dart';
import '../../domain/use_case/login_use_case.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../component/text_ipnput_field.dart';

//part 'login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = sl<LoginBloc>();
    bloc.add(LoginStarted());
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>.value(
      value: bloc,
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.message != null) {
            ShowPopup.showDiaLogNotifyton(
              context,
              LocaleKeys.notification_title,
              state.message!,
              LocaleKeys.button_confirm,
              null,
            );
          }
          if (state.success) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRouter.routerHome, (a) => false);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.colorWhite,
            body: Center(child: _formLogin(context, bloc)),
          );
        },
      ),
    );
  }

  Widget _formLogin(BuildContext context, LoginBloc bloc) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Username
          buildFieldLoginForm(
            title: LocaleKeys.login_inputUsername,
            hintText: LocaleKeys.login_hintPassword,
            svgIconLeading: Assets.ASSETS_ICONS_LOGIN_USER_ICON_SVG,
            isFocusedRx: bloc.state.isTaxFocused,
            currentNode: bloc.userNameFocus,
            controller: bloc.userNameController,
          ),

          /// Password
          buildFieldLoginForm(
              title: LocaleKeys.login_inputPassword,
              hintText: LocaleKeys.login_hintPassword,
              svgIconLeading: Assets.ASSETS_ICONS_IC_PASSWORD_SVG,
              isFocusedRx: bloc.state.isUserNameFocused,
              controller: bloc.passWorkController,
              currentNode: bloc.passwordFocus,
              obscureText: true,
              onEditingComplete: () {
                bloc.add(const LoginSubmitted());
              }),

          sdsSBHeight20,
          _formButtonSubmit(context, bloc),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }

  Widget _formButtonSubmit(BuildContext context, LoginBloc bloc) {
    return ButtonUtils.buildButton(
      LocaleKeys.login_login,
      () => bloc.add(const LoginSubmitted()),
      backgroundColor: AppColors.mainColors,
      isLoading: bloc.state.isLoading,
      showLoading: true,
      colorText: AppColors.basicWhite,
      height: AppDimens.btnMedium,
      borderRadius: BorderRadius.circular(AppDimens.radius12),
    );
  }
}
