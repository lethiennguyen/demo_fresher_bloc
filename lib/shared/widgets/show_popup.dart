import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/values/strings.dart';
import '../../lib.dart';
import 'input_form/input.src.dart';

class ShowPopup {
  static int _numDialog = 0;

  static void dismissDialog(BuildContext context) {
    if (_numDialog > 0) {
      Navigator.of(context).pop();
    }
  }

  static void showErrorMessage(
    BuildContext context,
    String error, {
    int code = 0,
    bool isExpiredToken = false,
  }) {
    if (_numDialog < 1) {
      if (isExpiredToken) {
        showDialogNotificationError(
          context,
          error,
          code: code,
          nameAction: LocaleKeys.app_logout,
          function: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouter.routerLogin,
              (route) => false,
            );
          },
        );
      } else {
        showDialogNotificationError(
          context,
          error,
          code: code,
          isActiveBack: false,
        );
      }
    }
  }

  static void showDialogNotificationError(
    BuildContext context,
    String content, {
    bool isActiveBack = true,
    Function? function,
    String nameAction = LocaleKeys.app_close,
    bool isExpiredToken = false,
    int code = 0,
  }) {
    _showDialog(
        context,
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: AppColors.basicWhite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Icon(
                    _buildIconDialog(content, code: code),
                    size: AppDimens.btnMediumTb,
                    color: AppColors.mainColors,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: TextUtils(
                      text: content,
                      availableStyle: StyleEnum.t16Bold,
                      // color: AppColors.primaryNavy,
                      textAlign: TextAlign.center,
                      maxLine: 6,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBox(
                  height: AppDimens.sizeIconBig,
                  width: double.infinity,
                  child: _baseButton(
                    context,
                    function,
                    nameAction,
                    // colorText: AppColors.primaryNavy,
                  ).marginAll(AppDimens.sizeIcon),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  static IconData _buildIconDialog(String errorStr, {int code = 0}) {
    switch (code) {
      case AppConst.error401:
      case AppConst.error500:
        return Icons.warning;
      case AppConst.error400:
        return Icons.alarm_off;
      case AppConst.error403:
        return Icons.lock;
      case 0:
        if (errorStr == LocaleKeys.app_noResponseFromSystem ||
            errorStr == LocaleKeys.app_errorConnectFailedStr) {
          return Icons.signal_wifi_off;
        }
        return Icons.notifications_none;
      default:
        return Icons.notifications_none;
    }
  }

  static void _showDialog(
    BuildContext context,
    Widget dialog,
    bool isActiveBack, {
    bool barrierDismissible = false,
  }) {
    _numDialog++;
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => NavigatorPopHandler(
        onPop: () => onBackPress(isActiveBack),
        child: dialog,
      ),
    ).whenComplete(() => _numDialog--);
  }

  static Future<bool> onBackPress(bool isActiveBack) {
    return Future.value(isActiveBack);
  }

  static Widget _baseButton(
    BuildContext context,
    Function? func,
    String text, {
    double? witdh,
    double? height,
    Color? color,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return UtilWidget.baseOnAction(
      onTap: () {
        dismissDialog(context);
        func?.call();
      },
      child: Container(
        width: witdh ?? 150,
        height: height ?? 40,
        decoration: BoxDecoration(
          color: color ?? const Color(0xffF24E1E),
          borderRadius: BorderRadius.circular(AppDimens.radius12),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.roboto(
              color: textColor ?? const Color(0xffffffff),
              fontSize: fontSize ?? 14,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  static void showDiaLogNotifyton(
    BuildContext context,
    String title,
    String message,
    String buttonText,
    VoidCallback? onComfirm, {
    bool isActiveBack = true,
  }) {
    _showDialog(
      context,
      Dialog(
        backgroundColor: AppColors.colorWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextUtils(
                text: title,
                color: AppColors.mainColors,
                fontWeight: FontWeight.w700,
                size: AppDimens.sizeTextMediumTb,
              ),
              sdsSBHeight20,
              TextUtils(
                text: message,
                color: AppColors.colorBlack,
                fontWeight: FontWeight.w600,
                maxLine: 3,
                size: AppDimens.sizeText14,
              ),
              sdsSBHeight20,
              _baseButton(
                context,
                onComfirm ??
                    () {
                      Navigator.pop(context);
                    },
                buttonText,
                color: const Color(0xffF24E1E),
                textColor: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void showDiaLogTextField(
    BuildContext context,
    String title,
    String buttonText,
    TextEditingController controller,
    FocusNode focusNode, {
    bool isActiveBack = true,
    String? hintText,
    VoidCallback? onConfirm,
    bool isShowLoading = false,
    String? Function(String?)? validator,
  }) {
    _showDialog(
      context,
      Dialog(
        backgroundColor: AppColors.colorWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextUtils(
                text: title,
                color: AppColors.mainColors,
                fontWeight: FontWeight.w700,
                size: AppDimens.sizeTextMediumTb,
              ),
              sdsSBHeight20,
              SDSInputWithLabel.buildInputData(
                validator: validator,
                heightInput: AppDimens.height45,
                textEditingController: controller,
                currentNode: focusNode,
                iconLeading: const Icon(
                  Icons.edit,
                  color: AppColors.grey,
                ),
                hintText: hintText ?? "",
                borderRadius: AppDimens.borderRadiusBig,
                paddingBottom: 0,
                isValidate: true,
                isValidateText: true,
                onChanged: (_) {},
              ),
              sdsSBHeight32,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // _baseButton(
                  //   () {},
                  //   LocaleKeys.button_cancel.tr,
                  //   color: const Color(0xffF24E1E),
                  //   textColor: Colors.white,
                  //   witdh: 100,
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w600,
                  // ),
                  ButtonUtils.buildButton(
                    LocaleKeys.button_cancel,
                    () {
                      Navigator.pop(context);
                    },
                    backgroundColor: AppColors.mainColors,
                    isLoading: false,
                    showLoading: true,
                    colorText: AppColors.basicWhite,
                    width: 100,
                    height: 40,
                    borderRadius: BorderRadius.circular(AppDimens.radius12),
                  ),
                  sdsSBHeight20,
                  ButtonUtils.buildButton(
                    buttonText,
                    onConfirm ??
                        () {
                          Navigator.pop(context);
                        },
                    backgroundColor: AppColors.mainColors,
                    isLoading: isShowLoading,
                    showLoading: true,
                    colorText: AppColors.basicWhite,
                    width: 100,
                    height: 40,
                    borderRadius: BorderRadius.circular(AppDimens.radius12),
                  ),
                  // _baseButton(
                  //   onConfirm ??
                  //       () {
                  //         Get.back();
                  //       },
                  //   buttonText,
                  //   color: const Color(0xffF24E1E),
                  //   textColor: Colors.white,
                  //   witdh: 100,
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w600,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }

  static void showDiaLogConfirm(
    BuildContext context,
    String title,
    String message,
    VoidCallback? onCancel,
    VoidCallback? onConfirm, {
    bool isActiveBack = true,
  }) {
    _showDialog(
      context,
      Dialog(
        backgroundColor: AppColors.colorWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextUtils(
                text: title,
                color: AppColors.mainColors,
                fontWeight: FontWeight.w700,
                size: AppDimens.sizeTextMediumTb,
              ),
              sdsSBHeight20,
              TextUtils(
                text: message,
                color: AppColors.colorBlack,
                fontWeight: FontWeight.w600,
                size: AppDimens.sizeText14,
              ),
              sdsSBHeight32,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _baseButton(
                    context,
                    onCancel,
                    AppStrings.noButton,
                    color: const Color(0xffF24E1E),
                    textColor: Colors.white,
                    witdh: 100,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  sdsSBHeight20,
                  _baseButton(
                    context,
                    onConfirm,
                    AppStrings.yesButton,
                    color: const Color(0xffF24E1E),
                    textColor: Colors.white,
                    witdh: 100,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      isActiveBack,
    );
  }
}

// Map ánh xạ giữa key lỗi (chưa dịch) và mã lỗi
const Map<String, int> errorMessageToCodeMap = {
  LocaleKeys.app_noResponseFromSystem: 0,
  LocaleKeys.app_errorConnectFailedStr: 0,
  LocaleKeys.app_otpInvalid: AppConst.error400,
  LocaleKeys.app_logInWrongPassword: AppConst.error401,
  LocaleKeys.app_loginSessionExpired: AppConst.error403,
  LocaleKeys.app_errorInternalServer: AppConst.error500,
};
