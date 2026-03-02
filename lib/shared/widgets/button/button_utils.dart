import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../core/values/app_string.dart';
import '../../../lib.dart';
import '../../shares.src.dart';

class ButtonUtils {
  static DateTime? _dateTime;
  static int _oldFunc = 0;

  /// Sử dụng để tránh trường hợp click liên tiếp khi thực hiện function
  static Widget baseOnAction({
    required Function onTap,
    required Widget child,
    bool isContinuous = false,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (isContinuous) {
          onTap();
        } else {
          DateTime now = DateTime.now();
          if (_dateTime == null ||
              now.difference(_dateTime ?? DateTime.now()) >
                  Duration(seconds: 2) ||
              onTap.hashCode != _oldFunc) {
            _dateTime = now;
            _oldFunc = onTap.hashCode;
            onTap();
          }
        }
      },
      child: child,
    );
  }

  // static Widget baseButton(
  //   Function? function,
  //   String text, {
  //   Color? colorText,
  // }) {
  //   return baseOnAction(
  //       onTap: () {
  //         ShowDialog.dismissDialog();
  //
  //         function?.call();
  //       },
  //       child: TextButton(
  //         onPressed: null,
  //         style: ButtonStyle(
  //           overlayColor: WidgetStateProperty.all(Colors.transparent),
  //         ),
  //         child: TextUtils(
  //           text: text,
  //           availableStyle: StyleEnum.bodyRegular,
  //           color: colorText ?? AppColors.colorBlack,
  //         ),
  //       ));
  // }

  static void onTapButton({required Function onTap, required bool isLoading}) {
    if (!isLoading) {
      DateTime now = DateTime.now();
      if (_dateTime == null ||
          now.difference(_dateTime ?? DateTime.now()) > Duration(seconds: 2) ||
          onTap.hashCode != _oldFunc) {
        _dateTime = now;
        _oldFunc = onTap.hashCode;
        onTap();
      }
    }
  }

  static Widget buildButton(
    String btnTitle,
    Function function, {
    List<Color> colors = AppColors.primaryMain,
    Color? backgroundColor,
    bool isLoading = false,
    bool visibleTextCenter = false,
    bool showLoading = true,
    IconData? icon,
    String? iconPng,
    Color? iconColor,
    double? iconSize,
    double? width,
    double? height,
    Color? colorText,
    Color? colorOverlay,
    BorderRadiusGeometry? borderRadius,
    Border? border,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? AppDimens.iconHeightButton,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? const Border(),
        gradient:
            backgroundColor != null ? null : LinearGradient(colors: colors),
        borderRadius: borderRadius ?? BorderRadius.circular(AppDimens.radius4),
      ),
      child: ElevatedButton(
        onPressed: () => onTapButton(isLoading: isLoading, onTap: function),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.colorTransparent,
          backgroundColor: AppColors.colorTransparent,
          shadowColor: AppColors.colorTransparent,
          padding: padding,
          shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppDimens.radius4)),
        ).copyWith(
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
            (states) {
              if (states.contains(WidgetState.pressed)) {
                return colorOverlay ??
                    AppColors.secondaryCamPastel.withAlpha((0.2 * 255).toInt());
              }
              return null;
            },
          ),
        ),
        child: Stack(
          children: [
            // if (icon != null)
            //   Align(
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: [
            //         SvgPicture.asset(
            //           icon,
            //           width: iconSize,
            //           height: iconSize,
            //         ).paddingOnly(right: AppDimens.padding16),
            //         // Icon(
            //         //   icon,
            //         //   size: iconSize,
            //         //   color: iconColor,
            //         // ),
            //         TextUtils(
            //           text: btnTitle,
            //           availableStyle: StyleEnum.t14Bold,
            //           color: colorText ?? AppColors.basicWhite,
            //         ),
            //       ],
            //     ),
            //   ),
            if (!(isLoading && showLoading))
              if (icon != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      // SvgPicture.asset(
                      //   icon,
                      //   width: iconSize,
                      //   height: iconSize,
                      // ).paddingOnly(right: AppDimens.padding16),
                      Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
                      TextUtils(
                        text: btnTitle,
                        availableStyle: StyleEnum.t14Bold,
                        color: colorText ?? AppColors.basicWhite,
                      ),
                    ],
                  ),
                ),
            if (!(isLoading && showLoading) && icon == null)
              TextUtils(
                text: btnTitle,
                availableStyle: StyleEnum.t14Bold,
                color: colorText ?? AppColors.basicWhite,
              ),
            if (isLoading && showLoading)
              Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  size: AppDimens.sizeIconLoading,
                  color: AppColors.colorWhite,
                ),
              ),
          ],
        ),
      ),
    ).paddingOnly(
      bottom: AppDimens.padding8,
    );
  }

  static Widget buildFooterButtons(
    BuildContext context, {
    String? textCancel,
    String? textConfirm,
    double? widthCancel,
    double? widthConfirm,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    bool showLoadingCancel = true,
    bool showLoadingConfirm = true,
  }) {
    return Row(
      children: [
        Expanded(
          child: ButtonUtils.buildButton(
            textCancel ?? "Thiết lập lại",
            onCancel ??
                () {
                  Navigator.pop(context);
                },
            backgroundColor: AppColors.basicWhite,
            showLoading: showLoadingCancel,
            colorText: AppColors.mainColors,
            height: AppDimens.btnMediumTbSmall,
            width: widthCancel,
            borderRadius: BorderRadius.circular(AppDimens.radius12),
            border: Border.all(color: AppColors.mainColors),
          ),
        ),
        sdsSBWidth16,
        Expanded(
          child: ButtonUtils.buildButton(
            textConfirm ?? LocaleKeys.button_confirm,
            onConfirm ?? () {},
            backgroundColor: AppColors.mainColors,
            showLoading: showLoadingConfirm,
            colorText: AppColors.basicWhite,
            height: AppDimens.btnMediumTbSmall,
            width: widthConfirm,
            borderRadius: BorderRadius.circular(AppDimens.radius12),
          ),
        ),
      ],
    );
  }

  static Widget towBaseButton({
    required String titleLeft,
    required String titleRight,
    required VoidCallback onPressLeft,
    required VoidCallback onPressRight,
  }) {
    return Row(
      children: [
        Expanded(
          child: ButtonUtils.buildButton(
            titleLeft,
            onPressLeft,
            backgroundColor: AppColors.basicWhite,
            colorOverlay: AppColors.primaryCam1.withAlpha((0.1 * 255).toInt()),
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            colorText: AppColors.primaryCam1,
            border: Border.all(color: AppColors.primaryCam1),
          ),
        ),
        sdsSBWidth20,
        Expanded(
          child: ButtonUtils.buildButton(
            titleRight,
            onPressRight,
            backgroundColor: AppColors.primaryCam1,
            colorOverlay: AppColors.basicWhite.withAlpha((0.08 * 255).toInt()),
            // nhẹ hơn
            borderRadius: BorderRadius.circular(AppDimens.radius4),
            colorText: AppColors.basicWhite,
          ),
        ),
      ],
    );
  }

  static Widget buildButtonCustomImage(
    String btnTitle,
    Function function, {
    List<Color> colors = AppColors.primaryMain,
    Color? backgroundColor,
    bool isLoading = false,
    bool visibleTextCenter = true,
    bool showLoading = true,
    String? icon,
    String? iconPng,
    Color? iconColor,
    double? iconSize,
    double? width,
    double? height,
    Color? colorText,
    BorderRadiusGeometry? borderRadius,
    Border? border,
    EdgeInsetsGeometry? padding,
  }) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? AppDimens.iconHeightButton,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: border ?? const Border(),
        gradient:
            backgroundColor != null ? null : LinearGradient(colors: colors),
        borderRadius: borderRadius ?? BorderRadius.circular(AppDimens.radius4),
      ),
      child: ElevatedButton(
        onPressed: () => onTapButton(isLoading: isLoading, onTap: function),
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          foregroundColor: AppColors.colorTransparent,
          backgroundColor: AppColors.colorTransparent,
          shadowColor: AppColors.colorTransparent,
          padding: padding,
          shape: RoundedRectangleBorder(
              borderRadius:
                  borderRadius ?? BorderRadius.circular(AppDimens.radius8)),
        ),
        child: Stack(
          children: [
            if (iconPng != null)
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconPng,
                      width: AppDimens.padding24,
                      height: AppDimens.padding24,
                    ).paddingOnly(right: AppDimens.padding12),
                    TextUtils(
                      text: btnTitle,
                      availableStyle: StyleEnum.t14Bold,
                      color: colorText ?? AppColors.basicWhite,
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                visible: isLoading && showLoading,
                child: const SizedBox(
                  height: AppDimens.sizeIconLoading,
                  width: AppDimens.sizeIconLoading,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: AppColors.basicWhite,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.statusRed,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildFilterButton({
    bool selected = false,
    VoidCallback? onPressed,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: CircleAvatar(
        radius: AppDimens.sizeTextDefault,
        backgroundColor: AppColors.mainColors,
        child: Stack(
          children: [
            const Icon(
              Icons.filter_alt,
              color: AppColors.colorWhite,
              size: AppDimens.sizeIcon,
            ),
            if (selected)
              const Positioned(
                top: 10,
                right: -1,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: AppDimens.borderRadiusBigger,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
