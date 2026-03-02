import 'package:badges/badges.dart' as badges;
import 'package:demo_fresher_bloc/shared/shares.src.dart';
import 'package:demo_fresher_bloc/shared/widgets/ratio_screen/ratio_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/values/app_string.dart';
import '../../../lib.dart';

class UtilWidget {
  static Widget buildLoading({
    Color? colorIcon,
  }) {
    return CupertinoActivityIndicator(
      color: colorIcon ?? AppColors.primaryColor,
    );
  }

  late final BuildContext context;
  static const Widget shrink = SizedBox.shrink();
  static Widget sizedBox4(BuildContext context) =>
      SizedBox(height: 4.h(context));
  static Widget sizedBox0(BuildContext context) =>
      SizedBox(height: 0.h(context));
  static Widget sizedBox5(BuildContext context) =>
      SizedBox(height: 5.h(context));
  static Widget sizedBox7(BuildContext context) =>
      SizedBox(height: 7.h(context));
  static Widget sizedBox8(BuildContext context) =>
      SizedBox(height: 8.h(context));
  static Widget sizedBox10(BuildContext context) =>
      SizedBox(height: 10.h(context));
  static Widget sizedBox12(BuildContext context) =>
      SizedBox(height: 12.h(context));
  static Widget sizedBox16(BuildContext context) =>
      SizedBox(height: 16.h(context));
  static Widget sizedBox20(BuildContext context) =>
      SizedBox(height: 20.h(context));
  static Widget sizedBox24(BuildContext context) =>
      SizedBox(height: 24.h(context));

  static Widget sizedBoxWidth5(BuildContext context) =>
      SizedBox(width: 5.w(context));
  static Widget sizedBoxWidth8(BuildContext context) =>
      SizedBox(width: 8.w(context));
  static Widget sizedBoxWidth10(BuildContext context) =>
      SizedBox(width: 10.w(context));
  static Widget sizedBoxWidth12(BuildContext context) =>
      SizedBox(width: 12.w(context));
  static Widget sizedBoxWidth16(BuildContext context) =>
      SizedBox(width: 16.w(context));
  static Widget sizedBoxWidth20(BuildContext context) =>
      SizedBox(width: 20.w(context));
  static Widget sizedBoxWidth25(BuildContext context) =>
      SizedBox(width: 25.w(context));
  static DateTime? _dateTime;
  static int? _oldFunc;

  /// Sử dụng để tránh trường hợp click liên tiếp khi thực hiện function
  static Widget baseOnAction({required Function onTap, required Widget child}) {
    return InkWell(
      onTap: () {
        DateTime now = DateTime.now();
        if (_dateTime == null ||
            now.difference(_dateTime ?? DateTime.now()) >
                Duration(seconds: 2) ||
            onTap.hashCode != _oldFunc) {
          _dateTime = now;
          _oldFunc = onTap.hashCode;
          onTap();
        }
      },
      child: child,
    );
  }

  static Widget buildSmartRefresherCustomFooter(
      {double? heightFooter, Widget? customLoading}) {
    return CustomFooter(
      height: heightFooter ?? 60,
      builder: (context, mode) {
        if (mode == LoadStatus.loading) {
          return customLoading ?? const CupertinoActivityIndicator();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  static Widget showSnackBar({required String title, required String message}) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      backgroundColor: AppColors.colorWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: AppColors.grey),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.emoji_emotions, color: AppColors.mainColors),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  fontWeight: FontWeight.bold,
                  size: AppDimens.sizeTextMediumTb,
                  color: AppColors.mainColors,
                ),
                const SizedBox(height: 4),
                TextUtils(
                  text: message,
                  fontWeight: FontWeight.normal,
                  size: AppDimens.sizeTextSmall,
                  color: AppColors.colorBlack,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> _showDialog<T>(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = false,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => child,
    );
  }

  static Future<void>? showConfirmDialog(
    BuildContext context, {
    required String title,
    String? subtitle,
    String? confirmTitle,
    String? cancelTitle,
    String typeAction = AppConst.actionFail,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = false,
  }) {
    return _showDialog(
      context,
      Dialog(
        elevation: 0,
        backgroundColor: Colors.white,
        insetPadding: const EdgeInsets.symmetric(
          vertical: AppDimens.defaultPadding,
          horizontal: AppDimens.padding24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (title.isNotEmpty)
              TextUtils(
                text: title,
                maxLine: 3,
                availableStyle: StyleEnum.t18Bold,
                textAlign: TextAlign.center,
              ),
            UtilWidget.sizedBox10(context),
            if (subtitle != null)
              Container(
                padding: const EdgeInsets.only(
                  bottom: AppDimens.padding24,
                ),
                constraints: const BoxConstraints(maxHeight: 200),
                child: SingleChildScrollView(
                  child: TextUtils(
                    text: subtitle,
                    availableStyle: StyleEnum.t16Regular,
                    textAlign: TextAlign.center,
                    color: AppColors.textColorGrey,
                    maxLine: 20,
                  ),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: UtilWidget.buildBackButton(
                    title: cancelTitle ?? LocaleKeys.dialog_cancel,
                    borderRadius: AppDimens.radius10,
                    textColor: AppColors.basicBlack,
                    backgroundColor: AppColors.dividerColor,
                    onPressed: () {
                      onCancel?.call();
                    },
                  ),
                ),
                UtilWidget.sizedBoxWidth20(context),
                Expanded(
                  child: UtilWidget.buildSolidButton(
                    borderRadius: AppDimens.radius10,
                    colorText: AppCollection.mapColorBorderSnackBar[typeAction],
                    backgroundColor:
                        AppCollection.mapColorBackgroundSnackBar[typeAction],
                    title: confirmTitle ?? LocaleKeys.dialog_confirm,
                    onPressed: () {
                      onConfirm?.call();
                    },
                  ),
                ),
              ],
            )
          ],
        ).paddingAll(AppDimens.padding16),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  ///CardBase
  static Widget buildCardBase(
    Widget child, {
    Color? colorBorder,
    Color? backgroundColor,
    double? radius,
    Gradient? gradient,
  }) =>
      Container(
        decoration: BoxDecoration(
          gradient: gradient,
          color: backgroundColor ?? Colors.white,
          borderRadius:
              BorderRadius.all(Radius.circular(radius ?? AppDimens.radius8)),
          border: Border.all(
            color: colorBorder ?? Colors.transparent,
          ),
        ),
        child: child,
      );

  static Widget buildSolidButton({
    required String title,
    VoidCallback? onPressed,
    double? width,
    double? height,
    double? borderRadius,
    Color? backgroundColor,
    BorderSide? side,
    Color? colorText,
  }) {
    return SizedBox(
      width: width,
      height: height ?? 44,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: side ?? BorderSide.none,
            borderRadius:
                BorderRadius.circular(borderRadius ?? AppDimens.radius4),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: TextUtils(
            text: title,
            availableStyle: StyleEnum.t16Bold,
            textAlign: TextAlign.center,
            color: colorText ?? AppColors.colorBlack,
            maxLine: 20,
          ),
        ),
      ),
    );
  }

  /// base item bottomSheet
  static Widget buildBottomSheetItem(
    BuildContext context, {
    IconData? icon, // Đổi thành nullable (không bắt buộc)
    String? svgPath, // Thêm tham số đường dẫn SVG
    required String label,
    required VoidCallback onTap,
    Color color = AppColors.colorBlack,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppDimens.padding16, horizontal: AppDimens.padding8),
        child: Row(
          children: [
            if (svgPath != null)
              SvgPicture.asset(
                svgPath,
                width: AppDimens.sizeIcon24,
                height: AppDimens.sizeIcon24,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              )
            else if (icon != null)
              Icon(icon, color: color, size: AppDimens.sizeIcon24)
            else
              const SizedBox(width: AppDimens.sizeIcon24),
            UtilWidget.sizedBoxWidth12(context),
            TextUtils(
              text: label,
              color: color,
              availableStyle: StyleEnum.t16Bold,
            )
          ],
        ),
      ),
    );
  }

  static Widget buildCircleName(String name,
      {double size = 40,
      Color backgroundColor = AppColors.primaryColor,
      Color textColor = AppColors.colorWhite,
      double fontSize = 16}) {
    String initials = '';
    List<String> nameParts = name.split(' ');
    if (nameParts.isNotEmpty) {
      initials += nameParts.first[0];
      if (nameParts.length > 1) {
        initials += nameParts.last[0];
      }
    }

    return CircleAvatar(
      radius: size / 2,
      backgroundColor: backgroundColor,
      child: Text(
        initials.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static Widget taskStatusChip(
      {required String title, Color? backgroundColor, Color? textColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: AppTextStyle.font12Bo.copyWith(
          color: textColor ?? AppColors.colorWhite,
        ),
      ),
    );
  }

  static Widget buildBackButton({
    required String title,
    VoidCallback? onPressed,
    double? width,
    double? height,
    double? borderRadius,
    double? borderSide,
    bool isBorderSide = false,
    Color? borderColor,
    Color? backgroundColor,
    Color? textColor,
    TextStyle? textStyle,
  }) {
    return SizedBox(
      width: width,
      height: height ?? 44,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.colorWhite,
          side: isBorderSide
              ? BorderSide(
                  color: borderColor ?? AppColors.mainColors,
                  width: borderSide ?? 1,
                )
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius ?? AppDimens.radius4),
          ),
        ),
        onPressed: onPressed,
        child: TextUtils(
          text: title,
          availableStyle: StyleEnum.t16Bold,
          textAlign: TextAlign.center,
          color: textColor ?? AppColors.colorBlack,
          maxLine: 20,
        ),
      ),
    );
  }

  static Future<void> showBaseImageSourceBottomSheet({
    required BuildContext context,
    required VoidCallback onTakePhoto,
    required VoidCallback onTakeCamera,
    required VoidCallback onPickFromGallery,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.basicWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppDimens.radius16),
        ),
      ),
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: AppDimens.padding12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: AppDimens.btnMediumTbSmall,
                    height: AppDimens.padding4,
                    decoration: BoxDecoration(
                      color: AppColors.basicGrey1,
                      borderRadius: BorderRadius.circular(AppDimens.radius8),
                    ),
                  ),
                ),
                sdsSBHeight12,
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const TextUtils(
                    text: 'Chụp ảnh từ Camera',
                    color: AppColors.basicBlack,
                    availableStyle: StyleEnum.t14Bold,
                  ),
                  onTap: onTakeCamera,
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const TextUtils(
                    text: 'Chụp ảnh',
                    color: AppColors.basicBlack,
                    availableStyle: StyleEnum.t14Bold,
                  ),
                  onTap: onTakePhoto,
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const TextUtils(
                    text: 'Lấy từ thư viện',
                    color: AppColors.basicBlack,
                    availableStyle: StyleEnum.t14Bold,
                  ),
                  onTap: onPickFromGallery,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget baseBottomSheet(
    BuildContext context, {
    required String title,
    required Widget body,
    Widget? iconTitle,
    bool isSecondDisplay = false,
    bool isMiniSize = false,
    double? paddingPage,
    double? miniSizeHeight,
    Function()? onPressed,
    Function()? onCancel,
    Widget? actionArrowBack,
    double? padding,
    double? paddingBottom,
    bool noAppBar = false,
    Color? backgroundColor,
    TextAlign? textAlign,
    double? maxWidth,
    AlignmentGeometry? alignment,
    bool isHeightMin = false,
    String? headerTitle,
    StyleEnum? styleEnum,
    bool? isShowHeader = true,
  }) {
    final mediaQuery = MediaQuery.of(context);
    return SafeArea(
      bottom: false,
      minimum: EdgeInsets.only(
        top: mediaQuery.padding.top + (isSecondDisplay ? 100 : 20),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: paddingPage ?? AppDimens.paddingVerySmall,
          ),
          decoration: BoxDecoration(
            color: backgroundColor ?? AppColors.colorWhite,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppDimens.paddingMedium),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              noAppBar
                  ? const SizedBox()
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColors.basicGrey3, width: 0.8),
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          TextUtils(
                            text: title,
                            availableStyle: styleEnum ?? StyleEnum.t20Bold,
                          ),
                          Positioned(
                            right: 0,
                            child: InkWell(
                              onTap:
                                  onCancel ?? () => Navigator.of(context).pop(),
                              child: const Icon(Icons.close, size: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
              isMiniSize
                  ? Flexible(
                      child: SizedBox(
                        height: isHeightMin
                            ? null
                            : (miniSizeHeight ?? mediaQuery.size.height / 2),
                        child: body,
                      ),
                    )
                  : Flexible(
                      fit: FlexFit.loose,
                      child: body,
                    ),
            ],
          ).paddingSymmetric(
            horizontal: padding ?? 0,
          ),
        ),
      ).paddingOnly(
        bottom: paddingBottom ?? 0,
      ),
    );
  }

  static Widget buildDropdown<T>({
    required List<T> items,
    required String Function(T) display,
    T? selectedItem,
    ValueChanged<T?>? onChanged,
    double height = 50,
    String? hintText,
    double? radius,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius:
            BorderRadius.all(Radius.circular(radius ?? AppDimens.radius8)),
        border: Border.all(color: AppColors.dsGray4),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.defaultPadding,
          ),
          child: DropdownButton<T>(
            dropdownColor: AppColors.colorWhite,
            isExpanded: true,
            selectedItemBuilder: (context) => items.map(
              (e) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    display(e),
                    style: AppTextStyle.font14Re,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                );
              },
            ).toList(),
            items: items
                .map(
                  (e) => DropdownMenuItem<T>(
                    value: e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.paddingVerySmall),
                      child: Text(
                        display(e),
                        style: selectedItem == e
                            ? AppTextStyle.font14Bo
                            : AppTextStyle.font14Re,
                        maxLines: 2,
                        textAlign: TextAlign.start,
                      ),
                      //   TextUtils(
                      // text: display(e),
                      // availableStyle: selectedItem == e
                      //     ? StyleEnum.bodyBold
                      //     : StyleEnum.bodyRegular,
                      //   maxLine: 2,
                      //   textAlign: TextAlign.start,
                      // ),
                    ),
                  ),
                )
                .toList(),
            value: selectedItem,
            onChanged: onChanged,
            hint: hintText != null
                ? Text(
                    hintText,
                    style: AppTextStyle.font14Re.copyWith(
                      color: AppColors.dsGray3,
                    ),
                    maxLines: 2,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  static Widget baseCard({
    Widget child = const SizedBox(),
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    double borderRadius = AppDimens.borderRadiusMed,
    double? width,
    double? height,
    VoidCallback? onTap,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
  }) {
    Widget content = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ?? const EdgeInsets.all(AppDimens.paddingVerySmall),
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.colorWhite,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
          boxShadow: boxShadow),
      child: Center(child: child),
    );

    if (onTap != null) {
      content = InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }

  static Widget baseCardWithDivider({
    required List<Widget> children,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? backgroundColor,
    double borderRadius = AppDimens.borderRadiusBig,
    double? width,
    double? height,
    VoidCallback? onTap,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
    Color dividerColor = AppColors.backgroundGrey,
    double dividerHeight = 1,
    EdgeInsetsGeometry dividerPadding =
        const EdgeInsets.symmetric(horizontal: 12),
  }) {
    final content = Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding ??
          const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingVerySmall,
              vertical: AppDimens.paddingSmall),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.colorWhite,
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow: boxShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildChildrenWithDivider(
          children,
          dividerColor,
          dividerHeight,
          dividerPadding,
        ),
      ),
    );

    if (onTap != null) {
      return InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }

  static List<Widget> _buildChildrenWithDivider(
    List<Widget> children,
    Color dividerColor,
    double dividerHeight,
    EdgeInsetsGeometry dividerPadding,
  ) {
    final widgets = <Widget>[];

    for (int i = 0; i < children.length; i++) {
      widgets.add(children[i]);

      if (i != children.length - 1) {
        widgets.add(
          Padding(
            padding: dividerPadding,
            child: Divider(
              height: 16,
              thickness: dividerHeight,
              color: dividerColor,
            ),
          ),
        );
      }
    }

    return widgets;
  }

  static Widget buildHeader(BuildContext context, {String? title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextUtils(
          text: title ?? "",
          color: AppColors.colorBlack,
          size: AppDimens.sizeTextMediumTb,
          fontWeight: FontWeight.w600,
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.clear),
        ),
      ],
    );
  }

  static Widget buildHeader2(BuildContext context,
      {String? title,
      double? textSize,
      FontWeight? fontWeight,
      Color? textColor,
      Color? color,
      double? border}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey2,
            width: border ?? 0.0,
          ),
        ),
        color: color ?? AppColors.basicWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextUtils(
            text: title ?? "",
            color: textColor ?? AppColors.colorBlack,
            size: textSize ?? AppDimens.sizeTextMediumTb,
            fontWeight: fontWeight ?? FontWeight.w600,
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }

  /// Widget cài đặt việc refresh page
  static Widget buildSmartRefresher(
      {required RefreshController refreshController,
      required Widget child,
      ScrollController? scrollController,
      Function()? onRefresh,
      Function()? onLoadMore,
      bool enablePullUp = false,
      bool enablePullDown = false,
      Widget? shimmer}) {
    return SmartRefresher(
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      scrollController: scrollController,
      header: const MaterialClassicHeader(),
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoadMore,
      footer: buildSmartRefresherCustomFooter(customLoading: shimmer),
      child: child,
    );
  }

  // Base app bar sliver
  // static Widget baseSliverAppBar({
  //   required Widget cardAppBar,
  //   required Widget body,
  //   Widget? appBAr,
  //   String? title,
  //   double? expandedHeight,
  //   double? borderRadius,
  //   double? elevation,
  //   Color? backgroundColor,
  //   Color? colorCard,
  //   bool? floating,
  //   bool? pinned,
  //   bool? snap,
  //   bool isBack = false,
  //   bool isTitle = false,
  // }) {
  //   final radius = borderRadius ?? 6.0;
  //   return CustomScrollView(
  //     physics: const ClampingScrollPhysics(),
  //     slivers: [
  //       SliverAppBar(
  //         expandedHeight: expandedHeight ?? 150,
  //         pinned: pinned ?? true,
  //         floating: floating ?? false,
  //         snap: snap ?? false,
  //         backgroundColor: backgroundColor ?? AppColors.secondaryOrange1,
  //         shadowColor: AppColors.grey,
  //         elevation: elevation ?? 0,
  //         automaticallyImplyLeading: isBack,
  //         // toolbarHeight: Get.height * 0.2,
  //         shape: RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.vertical(bottom: Radius.circular(radius))),
  //         flexibleSpace: LayoutBuilder(
  //           builder: (context, constraints) {
  //             double percent = ((constraints.maxHeight - kToolbarHeight) /
  //                     (120 - kToolbarHeight))
  //                 .clamp(0.0, 1.0);
  //             return FlexibleSpaceBar(
  //               collapseMode: CollapseMode.parallax,
  //               title: percent < 0.6
  //                   ? isTitle
  //                       ? appBAr
  //                       : TextUtils(
  //                           text: title ?? "",
  //                           color: Colors.white,
  //                           availableStyle: StyleEnum.t20Bold,
  //                         )
  //                   : null,
  //               background: Stack(
  //                 fit: StackFit.expand,
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                         color: colorCard ?? AppColors.secondaryOrange1,
  //                         borderRadius: BorderRadius.vertical(
  //                             bottom: Radius.circular(radius))),
  //                   ),
  //                   Positioned(
  //                     left: 0,
  //                     right: 0,
  //                     bottom: 8,
  //                     child: cardAppBar,
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //       // Body content
  //       SliverList(
  //         delegate: SliverChildListDelegate(
  //           [
  //             body,
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  static Widget buildTextInput({
    var height,
    Color? textColor,
    String? hintText,
    Color? hintColor,
    Color? fillColor,
    TextEditingController? controller,
    Function(String)? onChanged,
    Function()? onTap,
    Widget? prefixIcon,
    Widget? suffixIcon,
    FocusNode? focusNode,
    Color? borderColor,
    bool? autofocus,
    BorderRadius? borderRadius,
  }) {
    return SizedBox(
      height: height,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        autofocus: autofocus ?? true,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: AppDimens.sizeTextMediumTb,
        ),
        decoration: InputDecoration(
            hoverColor: Colors.white,
            prefixIcon: prefixIcon,
            fillColor: fillColor,
            filled: true,
            suffixIcon: suffixIcon,
            hintText: hintText ?? "",
            hintStyle: TextStyle(
              color: hintColor ?? Colors.black,
              fontSize: AppDimens.sizeTextMediumTb,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.grey),
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? Colors.grey),
              borderRadius: borderRadius ??
                  const BorderRadius.all(
                    Radius.circular(5),
                  ),
            ),
            contentPadding: const EdgeInsets.all(10)),
        onChanged: onChanged,
        onTap: onTap,
        controller: controller,
      ),
    );
  }

  static PreferredSizeWidget buildAppBar(BuildContext context, String title,
      {Color? textColor,
      Color? actionsIconColor,
      Color? backButtonColor,
      Color? backgroundColor,
      bool centerTitle = false,
      Function()? funcLeading,
      Widget? leading,
      List<Widget>? actions,
      bool isColorGradient = false,
      List<Color>? colorTransparent,
      bool automaticallyImplyLeading = false,
      bool showBackButton = true,
      StyleEnum? styleEnum,
      PreferredSizeWidget? widget}) {
    return AppBar(
      bottom: widget,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actionsIconTheme:
          IconThemeData(color: actionsIconColor ?? AppColors.textColorWhite),
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.textColorWhite,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      title: TextUtils(
        text: title,
        color: textColor ?? AppColors.textColorWhite,
        availableStyle: styleEnum ?? StyleEnum.t20Bold,
      ).paddingOnly(left: 10),
      centerTitle: centerTitle,
      titleSpacing: 0,
      leading: leading ??
          (showBackButton // Chỉ hiển thị nút back khi showBackButton = true
              ? IconButton(
                  onPressed: funcLeading ??
                      () {
                        Navigator.of(context).pop();
                      },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: backButtonColor ?? AppColors.basicWhite,
                  ),
                )
              : null),
      flexibleSpace: isColorGradient
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: colorTransparent ?? AppColors.colorHeadPayroll,
                ),
              ),
            )
          : null,
      actions: actions,
      backgroundColor:
          isColorGradient ? null : backgroundColor ?? AppColors.colorWhite,
      scrolledUnderElevation: 0,
      // không đổi khi scroll
      surfaceTintColor: Colors.transparent,
      // bỏ lớp tint
      elevation: 0,
      // tùy, nếu không muốn bóng
      shadowColor: Colors.transparent,
    );
  }

  static Widget buildSelectionBottomSheet<T>(
    BuildContext context, {
    required String title,
    required List<T> items,
    required bool Function(T) checkSelected,
    required String Function(T) itemTitleMapper,
    required Function(T) onItemSelected,
    required VoidCallback onConfirm,
    bool isAddItem = false,
    VoidCallback? onTap,
    String addItem = "Thêm mới",
    bool isLoading = false, // 👈 thêm dòng này
  }) {
    return UtilWidget.baseBottomSheet(
      context,
      title: title,
      isMiniSize: true,
      isHeightMin: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: isLoading
                ? ListView(
                    children: _buildShimmerList(),
                  )
                : ListView(
                    children: items.asMap().entries.expand((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      return [
                        if (index == 0) sdsSBHeight3,
                        if (index != 0) dividerBase02,
                        _buildItem(
                          title: itemTitleMapper(item),
                          isSelected: checkSelected(item),
                          onTap: () => onItemSelected(item),
                          isDelete: isAddItem,
                          onDelete: () => onItemSelected(item),
                        ),
                        sdsSBHeight3,
                        dividerBase02,
                      ];
                    }).toList(),
                  ),
          ),
          sdsSBHeight20,
          if (isAddItem)
            ElevatedButton(
              onPressed: onTap,
              child: Center(
                child: TextUtils(
                  text: addItem,
                  availableStyle: StyleEnum.t16Bold,
                  color: AppColors.mainColors,
                ),
              ),
            ),
          sdsSBHeight20,
          ButtonUtils.buildButton(
            LocaleKeys.my_task_confirm,
            onConfirm,
            backgroundColor: AppColors.mainColors,
          ),
          sdsSBHeight20,
        ],
      ),
    );
  }

  static List<Widget> _buildShimmerList() {
    return List.generate(
      6,
      (index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            padding: EdgeInsets.all(AppDimens.padding8),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  static Widget _buildItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
    bool isDelete = false,
    VoidCallback? onDelete,
  }) {
    return UtilWidget.baseCard(
      onTap: onTap,
      height: AppDimens.height45,
      borderRadius: 0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextUtils(
              text: title,
              availableStyle: StyleEnum.t16Bold,
              color: AppColors.basicBlack,
            ),
          ),
          if (isSelected) const Icon(Icons.check, color: AppColors.mainColors),
        ],
      ),
    );
  }

  static Widget badgeCount({required int count, bool isNotification = false}) {
    var position = badges.BadgePosition.topEnd(
      top: -10,
      end: count >= 10
          ? count > 99
              ? -10
              : -12
          : -8,
    );
    if (isNotification) {
      position = badges.BadgePosition.topEnd(
        top: -4,
        end: count >= 10
            ? count > 99
                ? -10
                : -6
            : 2,
      );
    }
    return badges.Badge(
      showBadge: count > 0,
      badgeStyle: count > 99
          ? badges.BadgeStyle(
              badgeColor: AppColors.statusRed,
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.circular(AppDimens.radius20),
            )
          : const badges.BadgeStyle(
              badgeColor: AppColors.statusRed,
            ),
      badgeAnimation: const badges.BadgeAnimation.scale(),
      position: position,
      badgeContent: count > 0
          ? Center(
              child: TextUtils(
                text: count > 99 ? '99+' : count.toString(),
                availableStyle: StyleEnum.t12Bold,
                color: AppColors.basicWhite,
              ),
            )
          : null,
    );
  }
}
