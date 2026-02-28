import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shares.src.dart';

/// VerySmall - [AppDimens.sizeText12] = 12
/// Small - [AppDimens.sizeText14] = 14
/// Medium - [AppDimens.sizeText16] = 16
/// Large - [AppDimens.sizeText20] = 20
/// Large Supper - [AppDimens.sizeText24] = 24
///
/// normal - [FontWeight.normal] = normal
/// bold - [FontWeight.bold] = w700

// Có thể bổ sung
enum StyleEnum {
  /// 10px
  t10Bold,

  /// 12px
  t12Regular,
  t12Bold,

  t13Regular,
  t13Bold,

  /// 14px
  t14Regular,
  t14Bold,

  /// 16px
  t16Regular,
  t16Bold,

  /// 15px
  t15Regular,
  t15Bold,

  /// 18px
  t18Bold,

  t19Bold,

  /// 20px
  t20Bold,

  /// 24px
  t24Bold,

  /// 28px
  t28Bold,
  t30Bold,

  /// Medium, bold
  subBold,

  ///Plus Jakarta Sans
  pjs16Bold,
}

class TextUtils extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final StyleEnum? availableStyle;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextStyle? customStyle;
  final FontStyle? fontStyle;
  final bool? isOverflow;
  final TextDecoration? textDecoration;
  final Color? colorDecoration;
  final TextOverflow? textOverFlow;

  const TextUtils(
      {super.key,
      required this.text,
      this.size,
      this.fontWeight,
      this.color,
      this.wordSpacing,
      this.availableStyle,
      this.maxLine,
      this.textAlign,
      this.customStyle,
      this.fontStyle,
      this.isOverflow,
      this.textDecoration,
      this.colorDecoration,
      this.textOverFlow});

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.sourceSans3().copyWith(
      fontSize: size ?? AppDimens.sizeText16,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.basicBlack,
      wordSpacing: wordSpacing,
      overflow: TextOverflow.ellipsis,
      fontStyle: fontStyle ?? FontStyle.normal,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: colorDecoration ?? colorDecoration,
    );

    if (availableStyle != null) {
      switch (availableStyle!) {
        case StyleEnum.t10Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText10,
            fontWeight: FontWeight.bold,
          );
          break;

        case StyleEnum.t12Regular:
          style = style.copyWith(
            fontSize: AppDimens.sizeText12,
            fontWeight: FontWeight.normal,
          );
          break;
        case StyleEnum.t12Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText12,
            fontWeight: FontWeight.bold,
          );
          break;

        case StyleEnum.t13Regular:
          style = style.copyWith(
            fontSize: AppDimens.sizeText13,
            fontWeight: FontWeight.normal,
          );
          break;
        case StyleEnum.t13Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText13,
            fontWeight: FontWeight.bold,
          );
          break;

        case StyleEnum.t14Regular:
          style = style.copyWith(
            fontSize: AppDimens.sizeText14,
            fontWeight: FontWeight.normal,
          );
          break;
        case StyleEnum.t14Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText14,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.t15Regular:
          style = style.copyWith(
            fontSize: AppDimens.sizeText15,
            fontWeight: FontWeight.normal,
          );
          break;
        case StyleEnum.t15Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText15,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.t16Regular:
          style = style.copyWith(
            fontSize: AppDimens.sizeText16,
            fontWeight: FontWeight.normal,
          );
          break;
        case StyleEnum.t16Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText16,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.t18Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText18,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.t19Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText19,
            fontWeight: FontWeight.bold,
          );
          break;

        case StyleEnum.t20Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText20,
            fontWeight: FontWeight.bold,
          );
          break;

        case StyleEnum.t24Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText24,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.t28Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText28,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.t30Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeText30,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.subBold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.pjs16Bold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
            fontWeight: FontWeight.bold,
          );
          break;
      }
    }

    return Text(
      text,
      style: customStyle ?? style,
      maxLines: maxLine ?? 1,
      textAlign: textAlign,
      overflow: isOverflow ?? false ? textOverFlow ?? TextOverflow.clip : null,
      softWrap: true,
    );
  }
}
