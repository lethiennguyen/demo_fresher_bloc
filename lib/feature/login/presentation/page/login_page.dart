import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.src.dart';
import '../../../../generated/locales.g.dart';
import '../../../../lib.dart';
import '../../../../shared/widgets/show_popup.dart';
import '../../domain/use_case/login_use_case.dart';
import '../bloc/login_controller.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../component/text_ipnput_field.dart';

//part 'login_widget.dart';

class LoginPage extends StatefulWidget {
  final LoginUseCase useCase;

  const LoginPage({
    super.key,
    required this.useCase,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController userNameController;
  late final TextEditingController passWorkController;

  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  // nếu bạn vẫn cần đổi style khi focus như RxBool trước đây
  final ValueNotifier<bool> isUserNameFocused = ValueNotifier(false);
  final ValueNotifier<bool> isPasswordFocused = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    final init = LoginState.initial();
    userNameController = TextEditingController(text: init.username);
    passWorkController = TextEditingController(text: init.password);

    userNameFocus
        .addListener(() => isUserNameFocused.value = userNameFocus.hasFocus);
    passwordFocus
        .addListener(() => isPasswordFocused.value = passwordFocus.hasFocus);
  }

  @override
  void dispose() {
    userNameController.dispose();
    passWorkController.dispose();
    userNameFocus.dispose();
    passwordFocus.dispose();
    isUserNameFocused.dispose();
    isPasswordFocused.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // dùng Get.find như dự án bạn đang dùng GetX DI
      create: (_) => LoginBloc(widget.useCase)..add(const LoginStarted()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (p, c) => p.message != c.message || p.success != c.success,
        listener: (context, state) {
          if (state.message != null) {
            ShowPopup.showDiaLogNotifyton(
              context,
              LocaleKeys.notification_title,
              state.message!,
              LocaleKeys.button_confirm,
              null,
            );
            context.read<LoginBloc>().add(const LoginMessageConsumed());
          }

          if (state.success) {
            Navigator.pushNamed(context, AppRouter.routerHome);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.colorWhite,
            body: Center(child: _formLogin(context, state)),
          );
        },
      ),
    );
  }

  Widget _formLogin(BuildContext context, LoginState state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          sdsSBHeight20,
          sdsSBHeight20,
          sdsSBHeight20,
          sdsSBHeight20,

          /// Username
          ValueListenableBuilder<bool>(
            valueListenable: isUserNameFocused,
            builder: (_, focused, __) {
              return buildFieldLoginForm(
                title: LocaleKeys.login_inputUsername,
                hintText: LocaleKeys.login_hintPassword,
                svgIconLeading: Assets.ASSETS_ICONS_LOGIN_USER_ICON_SVG,
                // chỗ này trước bạn truyền RxBool, giờ truyền bool/ValueNotifier tùy widget
                // nếu buildFieldLoginForm bắt buộc RxBool, nói mình để mình sửa widget đó 1 lần là xong
                isFocusedRx: focused,
                // <-- nếu widget nhận bool
                currentNode: userNameFocus,
                controller: userNameController,
              );
            },
          ),

          /// Password
          ValueListenableBuilder<bool>(
            valueListenable: isPasswordFocused,
            builder: (_, focused, __) {
              return buildFieldLoginForm(
                title: LocaleKeys.login_inputPassword,
                hintText: LocaleKeys.login_hintPassword,
                svgIconLeading: Assets.ASSETS_ICONS_IC_PASSWORD_SVG,
                isFocusedRx: focused,
                // <-- nếu widget nhận bool
                controller: passWorkController,
                currentNode: passwordFocus,
                obscureText: true,
                onEditingComplete: () {
                  context.read<LoginBloc>().add(const LoginSubmitted());
                },
              );
            },
          ),

          sdsSBHeight20,
          _formButtonSubmit(context, state),
        ],
      ).paddingSymmetric(horizontal: 16),
    );
  }

  Widget _formButtonSubmit(BuildContext context, LoginState state) {
    return ButtonUtils.buildButton(
      LocaleKeys.login_login,
      () => context.read<LoginBloc>().add(const LoginSubmitted()),
      backgroundColor: AppColors.mainColors,
      isLoading: state.isLoading,
      showLoading: true,
      colorText: AppColors.basicWhite,
      height: AppDimens.btnMedium,
      borderRadius: BorderRadius.circular(AppDimens.radius12),
    );
  }
}
