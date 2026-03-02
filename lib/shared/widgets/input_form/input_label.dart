import 'package:flutter/material.dart';
import '../../../core/values/app_string.dart';
import '../../model/input/input.src.dart';
import '../../shares.src.dart';
import 'input_text.dart';

class SDSInputWithLabel extends StatelessWidget {
  final SDSInputTextModel inputTextFormModel;
  final SDSInputLabelModel inputLabelModel;

  const SDSInputWithLabel({
    super.key,
    required this.inputLabelModel,
    required this.inputTextFormModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: inputLabelModel.label.isNotEmpty,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: inputLabelModel.paddingLabel ??
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding16),
                child: Row(
                  children: [
                    Flexible(
                      child: TextUtils(
                        text: inputLabelModel.label,
                        availableStyle:
                            inputLabelModel.styleEnum ?? StyleEnum.t16Bold,
                        color: inputLabelModel.colorTextLabel ??
                            AppColors.basicBlack,
                      ),
                    ),
                    TextUtils(
                      text: (inputLabelModel.isValidateText ?? false)
                          ? " (*)"
                          : "",
                      color: AppColors.statusRed,
                      availableStyle: StyleEnum.t12Regular,
                    ),
                    // AutoSizeText(
                    //   inputLabelModel.isValidate ? " *" : "",
                    //   style: Get.textTheme.bodyLarge?.copyWith(
                    //     color: Colors.red,
                    //   ),
                    // ),
                  ],
                ),
              ),
              sdsSB4,
            ],
          ),
        ),
        SDSInputText(
          inputTextFormModel
            ..autoValidateMode = inputTextFormModel.autoValidateMode ??
                AutovalidateMode.onUserInteraction
            ..validator = inputTextFormModel.validator ??
                (val) {
                  if (inputLabelModel.isValidate) {
                    if (val!.isNullOrEmpty) {
                      return LocaleKeys.login_errorEmpty;
                    }
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.phoneNumber &&
                      !val.isNullOrEmpty &&
                      !isPhoneValidate(value: val)) {
                    return LocaleKeys.login_errorPhoneNumberType;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.email &&
                      !val.isNullOrEmpty &&
                      !isEmail(val)) {
                    return LocaleKeys.login_errorEmail;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.identity &&
                      !val.isNullOrEmpty &&
                      !isIdentityCard(value: val)) {
                    return LocaleKeys.login_errorIdentityCard;
                  }
                  if (inputTextFormModel.inputFormatters ==
                          InputFormatterEnum.taxCode &&
                      !val.isNullOrEmpty &&
                      !isTaxCode(taxCode: val)) {
                    return LocaleKeys.login_errorTaxCodeCount;
                  }
                  if (inputTextFormModel.inputFormatters ==
                      InputFormatterEnum.dateFullBirthDay) {
                    final date = convertStringToDateStrict(
                      val!.trim(),
                      pattern1,
                    );

                    if (date == null) {
                      return LocaleKeys.login_errorDay;
                    }
                    // Chỉ được nhập từ năm 1899
                    if (date.year < 1900) {
                      return LocaleKeys.login_errorDay;
                    }
                    if (date.isAfter(DateTime.now())) {
                      return LocaleKeys.login_errorDay;
                    }
                    return null;
                  }
                  if (inputLabelModel.isValidate && (val?.isEmpty ?? false)) {
                    return "${inputLabelModel.label} ${LocaleKeys.login_validateEmpty}";
                  }
                  return null;
                },
        ),
      ],
    );
  }

  static Widget buildInputData(
      {String? title,
      required TextEditingController textEditingController,
      bool isReadOnly = false,
      required String hintText,
      int inputFormatters = 0,
      required FocusNode currentNode,
      bool isEnable = true,
      FocusNode? nextMode,
      TextInputType textInputType = TextInputType.text,
      VoidCallback? onEditingComplete,
      TextInputAction textInputAction = TextInputAction.next,
      Widget? suffixIcon,
      VoidCallback? onTap,
      bool isValidate = false,
      Color? fillColor,
      bool? filled,
      double? borderRadius,
      double? heightInput,
      Widget? iconLeading,
      Color? colorBorder,
      ValueChanged<String>? onChanged,
      double? paddingBottom,
      int? maxLengthInputForm,
      bool? isValidateText,
      int? maxLines,
      Color? colorTextLabel,
      Color? textColor,
      Color? suffixColor,
      Color? hintTextColor,
      Color focusBorderColor = AppColors.primaryCam1,
      EdgeInsetsGeometry? contentPadding,
      bool obscureText = false,
      String? Function(String?)? validator}) {
    return SDSInputWithLabel(
      inputLabelModel: SDSInputLabelModel(
        label: title ?? '',
        paddingLabel: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        styleEnum: StyleEnum.t14Bold,
        colorTextLabel: colorTextLabel ?? AppColors.basicBlack,
        isValidate: isValidate,
        isValidateText: isValidateText,
      ),
      inputTextFormModel: SDSInputTextModel(
        validator: validator,
        heightInput: heightInput,
        textColor: textColor,
        obscureText: obscureText,
        borderRadius: borderRadius ?? AppDimens.radius8,
        isShowCounterText: false,
        controller: textEditingController,
        isReadOnly: isReadOnly,
        maxLengthInputForm: maxLengthInputForm,
        hintTextSize: AppDimens.sizeText14,
        hintTextColor: hintTextColor ?? AppColors.basicGrey2,
        hintText: hintText,
        iconLeading: iconLeading,
        contentPadding: contentPadding ??
            const EdgeInsets.only(
              top: AppDimens.padding4,
              bottom: AppDimens.padding4,
              left: AppDimens.padding8,
            ),
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(borderRadius ?? AppDimens.radius4),
          borderSide: BorderSide(
            color: colorBorder ?? AppColors.basicGrey3,
          ),
        ),
        focusBorderColor: focusBorderColor,
        fillColor: isEnable ? fillColor : AppColors.basicGrey3,
        filled: filled ?? (!isEnable),
        focusNode: currentNode,
        nextNode: nextMode,
        onTap: onTap,
        textInputType: textInputType,
        iconNextTextInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        inputFormatters: inputFormatters,
        enable: isEnable,
        suffixIcon: suffixIcon,
        suffixColor: suffixColor,
        paddingModel: const EdgeInsets.symmetric(horizontal: 0),
        onChanged: onChanged,
        maxLines: maxLines,
      ),
      // autoValidateMode:
      //     (isValidateText ?? false) ? null : Auto validateMode.disabled,
    ).paddingOnly(bottom: paddingBottom ?? AppDimens.padding12);
  }
}
