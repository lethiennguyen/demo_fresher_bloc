// part of 'login_page.dart';
//
// Widget formLogin(LoginController controller) {
//   return SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         sdsSBHeight20,
//         sdsSBHeight20,
//         sdsSBHeight20,
//         sdsSBHeight20,
//         buildFieldLoginForm(
//           title: LocaleKeys.login_inputUsername.tr,
//           hintText: LocaleKeys.login_hintPassword.tr,
//           svgIconLeading: Assets.ASSETS_ICONS_LOGIN_USER_ICON_SVG,
//           isFocusedRx: controller.isTaxFocused,
//           currentNode: controller.userNameFocus,
//           controller: controller.userNameController,
//         ),
//         buildFieldLoginForm(
//           title: LocaleKeys.login_inputPassword.tr,
//           hintText: LocaleKeys.login_hintPassword.tr,
//           svgIconLeading: Assets.ASSETS_ICONS_IC_PASSWORD_SVG,
//           isFocusedRx: controller.isUserNameFocused,
//           controller: controller.passWorkController,
//           currentNode: controller.passwordFocus,
//           obscureText: true,
//           onEditingComplete: () {
//             controller.login();
//           },
//         ),
//         sdsSBHeight20,
//         _formButtonSubmit(controller)
//       ],
//     ).paddingSymmetric(horizontal: 16),
//   );
// }
//
// Widget _formButtonSubmit(LoginController controller) {
//   return Obx(
//     () => ButtonUtils.buildButton(
//       LocaleKeys.login_login.tr,
//       () {
//         controller.login();
//       },
//       backgroundColor: AppColors.mainColors,
//       isLoading: controller.isShowLoading.value,
//       showLoading: true,
//       colorText: AppColors.basicWhite,
//       height: AppDimens.btnMedium,
//       borderRadius: BorderRadius.circular(AppDimens.radius12),
//     ),
//   );
// }
