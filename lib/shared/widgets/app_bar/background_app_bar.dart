import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shares.src.dart';

class BackgroundAppBar {
  static PreferredSizeWidget buildAppBar(
    BuildContext context,
    String title, {
    Color? textColor,
    Color? actionsIconColor,
    Color? backButtonColor,
    Color? backgroundColor,
    bool centerTitle = false,
    StyleEnum? availableStyle,
    FontWeight fontWeight = FontWeight.w400,
    Function()? funcLeading,
    bool leading = true,
    List<Widget>? actions,
    bool isColorGradient = false,
    List<Color>? colorTransparent,
    PreferredSizeWidget? widget,
    Widget? titleWidget,
    Widget? leadingWidget,
    bool statusBarIconBrightness = false,
    bool isContinuous = true,
    double? iconSize,
    TextAlign? textAlign,
  }) {
    return AppBar(
      bottom: widget,
      surfaceTintColor: AppColors.basicWhite,
      actionsIconTheme:
          IconThemeData(color: actionsIconColor ?? AppColors.basicBlack),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.colorTransparent,
        statusBarBrightness:
            statusBarIconBrightness ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            statusBarIconBrightness ? Brightness.light : Brightness.dark,
      ),
      title: titleWidget ??
          TextUtils(
            text: title,
            availableStyle: availableStyle ?? StyleEnum.subBold,
            color: textColor ?? AppColors.basicBlack,
            textAlign: textAlign ?? TextAlign.center,
            maxLine: 2,
          ),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      leading: !leading
          ? leadingWidget
          : ButtonUtils.baseOnAction(
              onTap: () {
                if (funcLeading != null) {
                  funcLeading();
                } else {
                  Navigator.pop(context);
                }
              },
              isContinuous: isContinuous,
              child: Icon(
                Icons.chevron_left,
                color: backButtonColor ?? AppColors.basicBlack,
                size: iconSize ?? AppDimens.sizeIconMedium,
              ),
            ),
      backgroundColor: backgroundColor ?? AppColors.colorTransparent,
      // flexibleSpace: isColorGradient
      //     ? Container(
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //             begin: Alignment.bottomLeft,
      //             end: Alignment.bottomRight,
      //             colors: colorTransparent ??
      //                 <Color>[
      //                   AppColors.colorBackgroundLight,
      //                   AppColors.colorBackgroundLight,
      //                 ],
      //           ),
      //         ),
      //       )
      //     : null,
      actions: actions,
      titleSpacing: titleWidget == null ? null : 0,
    );
  }
}
