import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../lib.dart';
import '../../../../shared/widgets/input_form/input.src.dart';

Widget buildFieldLoginForm(
    {String title = '',
      String hintText = '',
      String? svgIconLeading,
      TextEditingController? controller,
      FocusNode? currentNode,
      bool? isFocusedRx,
      double sizeIconLeading = 16,
      Widget? suffixIcon,
      bool? isValidateText,
      bool obscureText = false,
      VoidCallback? onEditingComplete,
      TextInputAction iconNextTextInputAction = TextInputAction.next,
      String? Function(String?)? validator}) {
  final focusNodeRx = currentNode ?? FocusNode();
  return SDSInputWithLabel.buildInputData(
      validator: validator,
      isValidateText: isValidateText,
      hintTextColor: AppColors.colorBasic,
      suffixIcon: suffixIcon,
      title: title,
      colorTextLabel: AppColors.colorBlack,
      textEditingController: controller ?? TextEditingController(),
      // isReadOnly: false,
      hintText: hintText,
      obscureText: obscureText,
      currentNode: focusNodeRx,
      filled: true,
      fillColor: AppColors.basicWhite,
      colorBorder: AppColors.colorBasic,
      focusBorderColor: AppColors.primaryCam1,
      textColor: AppColors.colorBlack,
      borderRadius: AppDimens.radius12,
      onEditingComplete: onEditingComplete,
      textInputAction: iconNextTextInputAction,
      iconLeading: svgIconLeading != null
          ? Padding(
        padding: const EdgeInsets.all(AppDimens.padding8),
        child: Container(
          padding: const EdgeInsets.all(AppDimens.padding6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backgroundFail,
          ),
          child: SvgPicture.asset(
            svgIconLeading,
            width: sizeIconLeading,
            height: sizeIconLeading,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
                AppColors.primaryCam1, BlendMode.srcIn),
          ),
        ),
      )
          : null,
      // borderRadius: AppDimens.radius36,
      contentPadding: const EdgeInsets.only(
          top: AppDimens.padding4,
          bottom: AppDimens.padding4,
          left: AppDimens.padding20,
          right: AppDimens.padding20));
}