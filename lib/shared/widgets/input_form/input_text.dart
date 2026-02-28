import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../assets.dart';
import '../../model/input/input.src.dart';
import '../../shares.src.dart';
import '../../utils/formatter/formatter.src.dart';

class SDSInputText extends StatefulWidget {
  final SDSInputTextModel inputTextFormModel;

  const SDSInputText(this.inputTextFormModel, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SDSInputTextState createState() => _SDSInputTextState();
}

class _SDSInputTextState extends State<SDSInputText> with FormatterEnum {
  bool _isShowButtonClear = false;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState(); // Nên gọi super.initState() đầu tiên
    _setupControllerListener();
    // Khởi tạo giá trị ban đầu
    _showPassword = widget.inputTextFormModel.obscureText;
  }

  void _setupControllerListener() {
    widget.inputTextFormModel.controller.addListener(_controllerListener);
  }

  void _controllerListener() {
    if (widget.inputTextFormModel.controller.text.isNotEmpty) {
      if (!_isShowButtonClear) _isShowButtonClear = true;
    } else {
      if (_isShowButtonClear) _isShowButtonClear = false;
    }
  }

  @override
  void dispose() {
    // Nhớ remove listener để tránh memory leak
    widget.inputTextFormModel.controller.removeListener(_controllerListener);
    super.dispose();
  }

  @override
  void didUpdateWidget(SDSInputText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.inputTextFormModel.obscureText != _showPassword) {
      _showPassword = widget.inputTextFormModel.obscureText;
    }

    if (widget.inputTextFormModel.controller !=
        oldWidget.inputTextFormModel.controller) {
      oldWidget.inputTextFormModel.controller
          .removeListener(_controllerListener);
      widget.inputTextFormModel.controller.addListener(_controllerListener);
    }
  }

  Widget? _suffixIcon() {
    if (widget.inputTextFormModel.suffixIcon != null) {
      return widget.inputTextFormModel.suffixIcon;
    }
    if (!_isShowButtonClear || widget.inputTextFormModel.isReadOnly) {
      return null;
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: widget.inputTextFormModel.obscureText,
          child: InkWell(
            onTap: () {
              _showPassword;
            },
            child: Padding(
              padding: const EdgeInsets.all(
                AppDimens.padding8,
              ),
              child: SvgPicture.asset(
                  _showPassword
                      ? Assets.ASSETS_ICONS_ICON_HIDDEN_EYE_SVG
                      : Assets.ASSETS_ICONS_ICON_APPEAR_EYE_SVG,
                  colorFilter: ColorFilter.mode(
                      widget.inputTextFormModel.suffixColor ??
                          AppColors.basicGrey1,
                      BlendMode.srcIn)),
              /*Icon(
                _showPassword.value
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined,
                color: widget.inputTextFormModel.suffixColor ??
                    AppColors.basicGrey1,
              )*/
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            widget.inputTextFormModel.controller.clear();
            widget.inputTextFormModel.onChanged?.call('');
            _isShowButtonClear = false;
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: AppDimens.padding8,
            ),
            child: Icon(
              Icons.clear,
              color:
                  widget.inputTextFormModel.suffixColor ?? AppColors.basicGrey1,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    InputBorder? border = widget.inputTextFormModel.border ??
        const UnderlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.basicGrey4),
        );
    return Padding(
      padding: widget.inputTextFormModel.paddingModel ??
          const EdgeInsets.symmetric(
            horizontal: AppDimens.padding8,
          ),
      child: Theme(
        data: Theme.of(context).copyWith(
          textSelectionTheme: TextSelectionThemeData(
            cursorColor:
                widget.inputTextFormModel.textColor ?? AppColors.colorBlack,
            selectionHandleColor:
                widget.inputTextFormModel.textColor ?? AppColors.colorBlack,
          ),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: widget.inputTextFormModel.heightInput ?? 56,
            maxHeight: 100,
          ),
          child: TextFormField(
            cursorColor:
                widget.inputTextFormModel.textColor ?? AppColors.colorBlack,
            maxLines: widget.inputTextFormModel.maxLines ?? 1,
            inputFormatters: getFormatters(widget.inputTextFormModel),
            validator: widget.inputTextFormModel.validator,
            autovalidateMode: widget.inputTextFormModel.autoValidateMode ??
                (widget.inputTextFormModel.controller.text.isNullOrEmpty
                    ? AutovalidateMode.disabled
                    : AutovalidateMode.always),
            onChanged: (v) {
              if (!_isShowButtonClear || v.isEmpty) {
                _isShowButtonClear = v.isNotEmpty;
              }
              widget.inputTextFormModel.onChanged?.call(v);
            },
            textInputAction: widget.inputTextFormModel.iconNextTextInputAction,
            style: widget.inputTextFormModel.style ??
                FontStyleUtils.fontStyleSans(
                  fontSize: widget.inputTextFormModel.textSize ??
                      AppDimens.fontSmall(context),
                  color: widget.inputTextFormModel.textColor ??
                      AppColors.colorBlack,
                )
            /*Get.textTheme.bodyLarge?.copyWith(
                          fontSize: widget.inputTextFormModel.textSize ??
                              AppDimens.fontSmall(),
                          color: widget.inputTextFormModel.textColor ??
                              Colors.black)*/
            ,
            controller: widget.inputTextFormModel.controller,
            obscureText: _showPassword,
            onTap: widget.inputTextFormModel.onTap,
            enabled: widget.inputTextFormModel.enable,
            autofocus: widget.inputTextFormModel.autoFocus,
            focusNode: widget.inputTextFormModel.focusNode,
            onTapOutside: widget.inputTextFormModel.onTapOutside,
            scrollPadding: const EdgeInsets.only(
              bottom: AppDimens.scrollPadding,
            ),
            keyboardType: widget.inputTextFormModel.textInputType,
            readOnly: widget.inputTextFormModel.isReadOnly,
            maxLength: widget.inputTextFormModel.maxLengthInputForm,
            textAlign: widget.inputTextFormModel.textAlign ?? TextAlign.left,
            onFieldSubmitted: (v) {
              if (widget.inputTextFormModel.submitFunc != null) {
                widget.inputTextFormModel.submitFunc!.call(v);
              } else if (widget.inputTextFormModel.iconNextTextInputAction
                      .toString() ==
                  TextInputAction.next.toString()) {
                FocusScope.of(context)
                    .requestFocus(widget.inputTextFormModel.nextNode);

                widget.inputTextFormModel.onNext?.call(v);
              }
            },
            showCursor: widget.inputTextFormModel.showCursor,
            decoration: InputDecoration(
              counterText:
                  widget.inputTextFormModel.isShowCounterText ? null : '',
              filled: widget.inputTextFormModel.filled,
              fillColor:
                  widget.inputTextFormModel.fillColor ?? Colors.transparent,
              hoverColor:
                  widget.inputTextFormModel.fillColor ?? Colors.transparent,
              hintStyle: FontStyleUtils.fontStyleSans(
                fontSize: widget.inputTextFormModel.hintTextSize ??
                    AppDimens.fontSmallest(context),
                color: widget.inputTextFormModel.hintTextColor ??
                    AppColors.basicGrey4,
              ) /*TextStyle(
                    fontSize: widget.inputTextFormModel.hintTextSize ??
                        AppDimens.fontSmallest(),
                    color: widget.inputTextFormModel.hintTextColor ??
                        AppColors.basicGrey4,
                  )*/
              ,
              errorMaxLines: widget.inputTextFormModel.errorMaxLines,
              hintText: widget.inputTextFormModel.hintText,
              labelText: widget.inputTextFormModel.labelText,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              errorStyle: FontStyleUtils.fontStyleSans(
                fontSize: AppDimens.fontSmall(context),
                color: widget.inputTextFormModel.errorTextColor ??
                    AppColors.statusRed,
              ) /*TextStyle(
                    color: widget.inputTextFormModel.errorTextColor ??
                        AppColors.statusRed,
                  )*/
              ,
              prefixIcon: widget.inputTextFormModel.iconLeading,
              prefixStyle: const TextStyle(
                  color: AppColors.basicGrey1,
                  backgroundColor: AppColors.basicGrey1),
              border: border,
              enabledBorder: border,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      widget.inputTextFormModel.borderRadius),
                  borderSide: BorderSide(
                    color: widget.inputTextFormModel.focusBorderColor,
                  )),
              contentPadding: widget.inputTextFormModel.contentPadding ??
                  const EdgeInsets.only(
                    top: AppDimens.padding8,
                    bottom: AppDimens.padding8,
                  ),
              suffixIcon: widget.inputTextFormModel.showIconClear
                  ? _suffixIcon()
                  : null,
              helperText: widget.inputTextFormModel.helperText,
              helperStyle: widget.inputTextFormModel.helperStyle,
              helperMaxLines: widget.inputTextFormModel.helperMaxLines,
            ),
            onEditingComplete: widget.inputTextFormModel.onEditingComplete,
          ),
        ),
      ),
    );
  }
}
