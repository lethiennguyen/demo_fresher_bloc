import 'package:flutter/material.dart';

import '../../widgets/text/text_utils.dart';

class SDSInputLabelModel {
  final String label;

  final bool isValidate;

  final bool? isValidateText;

  final StyleEnum? styleEnum;

  final EdgeInsetsGeometry? paddingLabel;

  final double? padding;

  final Color? colorTextLabel;

  final bool? isPassword;

  SDSInputLabelModel({
    required this.label,
    this.isValidate = false,
    this.styleEnum,
    this.paddingLabel,
    this.padding,
    this.colorTextLabel,
    this.isValidateText,
    this.isPassword
  });
}
