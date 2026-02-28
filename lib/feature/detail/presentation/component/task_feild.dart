// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../../lib.dart';
//
// class IconLeadingTextField extends TaskField {
//   const IconLeadingTextField({
//     super.key,
//     super.fontSize,
//     required this.label,
//     super.isRequired = false,
//     this.leadingIcon,
//     this.hintText = 'Nhập nội dung...',
//     this.minLines = 3,
//     this.maxLines = 6,
//     required this.controller,
//     this.backgroundColor,
//     this.readOnly,
//     this.isVertical = true,
//     this.inputType,
//     this.widthInput,
//     this.padding,
//   });
//
//   @override
//   final String label;
//   final IconData? leadingIcon;
//   final String hintText;
//   final int minLines;
//   final int maxLines;
//   final TextEditingController controller;
//   final Color? backgroundColor;
//   final bool? readOnly;
//   final bool? isVertical;
//   final double? widthInput;
//   final TextInputType? inputType;
//   final EdgeInsets? padding;
//
//   @override
//   Widget buildField() {
//     return Container(
//       padding: padding ?? const EdgeInsets.all(AppDimens.paddingSmallest),
//       decoration: BoxDecoration(
//         color: backgroundColor ?? AppColors.backgroundGrey,
//         borderRadius: BorderRadius.circular(AppDimens.borderRadiusBig),
//       ),
//       child: isVertical == true
//           ? Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     // Icon leading
//                     if (leadingIcon != null)
//                       Icon(
//                         leadingIcon,
//                         size: AppDimens.sizeIcon,
//                         color: AppColors.basicGrey2,
//                       ),
//                     if (leadingIcon != null) UtilWidget.sizedBoxWidth10,
//
//                     Expanded(
//                       child: Row(
//                         children: [
//                           TextUtils(
//                             text: label,
//                             // fontSize: fontSize ?? AppDimens.fontSmall(),
//                             availableStyle: StyleEnum.t14Bold,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.colorBlack,
//                           ),
//                           if (isRequired)
//                             const TextUtils(
//                               text: ' *',
//                               color: AppColors.redDark,
//                               fontWeight: FontWeight.bold,
//                               availableStyle: StyleEnum.t14Bold,
//                               // fontSize: AppDimens.fontSmall14(),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 sdsSBHeight10,
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: AppDimens.paddingSmallest),
//                   child: TextField(
//                     controller: controller,
//                     minLines: minLines,
//                     maxLines: maxLines,
//                     textCapitalization: TextCapitalization.sentences,
//                     cursorColor: AppColors.basicBlack,
//                     readOnly: readOnly ?? false,
//                     style: TextStyle(
//                       fontSize: fontSize ?? AppDimens.fontSmall(),
//                       color: AppColors.colorBlack,
//                     ),
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       hintStyle: TextStyle(
//                         color: AppColors.grey,
//                         fontSize: fontSize ?? AppDimens.fontSmall(),
//                       ),
//                       border: InputBorder.none,
//                       isDense: true,
//                       contentPadding: EdgeInsets.zero,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           : Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(
//                   child: Row(
//                     children: [
//                       if (leadingIcon != null) ...[
//                         Icon(
//                           leadingIcon,
//                           size: AppDimens.sizeIcon,
//                           color: AppColors.basicGrey2,
//                         ),
//                         UtilWidget.sizedBoxWidth10,
//                       ],
//                       TextUtils(
//                         text: label,
//                         availableStyle: StyleEnum.t14Bold,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.colorBlack,
//                       ),
//                       if (isRequired)
//                         const TextUtils(
//                           text: ' *',
//                           color: AppColors.redDark,
//                           fontWeight: FontWeight.bold,
//                           availableStyle: StyleEnum.t14Bold,
//                         ),
//                     ],
//                   ),
//                 ),
//
//                 /// Label + TextField chiếm phần còn lại
//                 SizedBox(
//                   width: widthInput ?? 100,
//                   child: TextField(
//                     controller: controller,
//                     minLines: minLines,
//                     maxLines: maxLines,
//                     keyboardType: inputType ?? TextInputType.number,
//                     readOnly: readOnly ?? false,
//                     textAlign: TextAlign.right,
//                     textCapitalization: TextCapitalization.sentences,
//                     style: TextStyle(
//                       fontSize: fontSize ?? AppDimens.fontSmall(),
//                       color: AppColors.colorBlack,
//                     ),
//                     decoration: InputDecoration(
//                       hintText: hintText,
//                       hintStyle: TextStyle(
//                         color: AppColors.grey,
//                         fontSize: fontSize ?? AppDimens.fontSmall(),
//                       ),
//                       border: InputBorder.none,
//                       isDense: true,
//                       contentPadding: EdgeInsets.zero,
//                     ),
//                   ),
//                 ).paddingOnly(right: AppDimens.padding8),
//               ],
//             ),
//     );
//   }
// }
//
// class IconLeadingBottomSheetField<T> extends TaskField {
//   const IconLeadingBottomSheetField(
//       {super.key,
//       super.fontSize,
//       required super.label,
//       super.direction = Axis.vertical,
//       super.isRequired = true,
//       this.leadingIcon,
//       this.hintText,
//       this.trailingIcon,
//       required this.value,
//       this.onOpenBottomSheet,
//       this.itemBuilder,
//       this.backgroundColor,
//       this.showAbbreviation = false,
//       this.abbreviationBuilder,
//       this.textColor});
//
//   final IconData? leadingIcon;
//   final String? hintText;
//   final IconData? trailingIcon;
//
//   /// Giá trị đang chọn
//   final Rx<T?> value;
//
//   /// Hàm mở bottom sheet (inject từ ngoài)
//   final Future<T?> Function()? onOpenBottomSheet;
//
//   /// Convert T -> String
//   final String Function(T item)? itemBuilder;
//
//   final Color? backgroundColor;
//   final Color? textColor;
//   final bool showAbbreviation;
//   final String? Function(T item)? abbreviationBuilder;
//
//   Widget _buildValue(T item) {
//     final title = itemBuilder?.call(item) ?? item.toString();
//
//     final abbreviation = abbreviationBuilder?.call(item) ??
//         (title.isNotEmpty ? title.abbreviation : '');
//
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         if (showAbbreviation && abbreviation.isNotEmpty) ...[
//           CircleAvatar(
//             radius: 13,
//             backgroundColor: AppColors.mainColors,
//             child: TextUtils(
//               text: abbreviation,
//               availableStyle: StyleEnum.t14Bold,
//               isOverflow: true,
//               color: AppColors.colorWhite,
//             ),
//           ),
//           UtilWidget.sizedBoxWidth5,
//         ],
//         Flexible(
//           child: TextUtils(
//               text: title,
//               availableStyle: StyleEnum.t14Bold,
//               isOverflow: true,
//               textOverFlow: TextOverflow.ellipsis,
//               color: textColor ?? AppColors.basicBlack),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget buildField() {
//     return Obx(
//       () => InkWell(
//         borderRadius: BorderRadius.circular(AppDimens.borderRadiusBig),
//         onTap: () async {
//           if (onOpenBottomSheet == null) return;
//           final result = await onOpenBottomSheet!();
//           if (result != null) {
//             value.value = result;
//           }
//         },
//         child: Container(
//           height: AppDimens.btnMediumTb,
//           padding: const EdgeInsets.symmetric(
//             horizontal: AppDimens.paddingVerySmall,
//           ),
//           decoration: BoxDecoration(
//             color: AppColors.colorWhite,
//             borderRadius: BorderRadius.circular(
//               AppDimens.borderRadiusBig,
//             ),
//           ),
//           child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               /// ICON LEADING
//               if (leadingIcon != null) ...[
//                 Icon(
//                   leadingIcon,
//                   size: AppDimens.sizeIcon,
//                   color: AppColors.basicGrey2,
//                 ),
//                 UtilWidget.sizedBoxWidth10,
//               ],
//
//               /// LABEL
//               TextUtils(
//                 text: label ?? '',
//                 // fontWeight: FontWeight.bold,
//                 availableStyle: StyleEnum.t14Bold,
//                 //   fontSize: fontSize ?? AppDimens.fontSmall(),
//                 color: AppColors.basicBlack,
//               ),
//               if (isRequired)
//                 const TextUtils(
//                   text: ' *',
//                   color: AppColors.redDark,
//                   fontWeight: FontWeight.bold,
//                 ),
//
//               UtilWidget.sizedBoxWidth10,
//
//               /// VALUE / HINT
//               /// VALUE / HINT
//               Expanded(
//                 child: Align(
//                   alignment: Alignment.centerRight,
//                   child: value.value != null
//                       ? _buildValue(
//                           value.value as T,
//                         )
//                       : TextUtils(
//                           text: hintText ?? '',
//                           availableStyle: StyleEnum.t14Regular,
//                           //  fontSize: fontSize ?? AppDimens.fontSmall(),
//                           color: AppColors.grey,
//                         ),
//                 ),
//               ),
//
//               /// TRAILING ICON
//               if (trailingIcon != null)
//                 Icon(
//                   trailingIcon ?? Icons.keyboard_arrow_down,
//                   size: AppDimens.sizeIcon,
//                   color: AppColors.basicGrey2,
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// abstract class TaskField extends StatelessWidget {
//   const TaskField(
//       {super.key,
//       this.label,
//       required this.isRequired,
//       this.fontSize,
//       this.direction = Axis.vertical,
//       this.isShowLabel = true});
//
//   final String? label;
//   final Axis direction;
//   final bool isRequired;
//   final double? fontSize;
//   final bool? isShowLabel;
//
//   EdgeInsets get labelPadding => EdgeInsets.zero;
//
//   /// Describes the part of the user interface represented by this widget.
//   Widget buildField();
//
//   Widget _buildLabel() {
//     return isShowLabel ?? true
//         ? Padding(
//             padding: labelPadding,
//             child: Row(
//               children: [
//                 UtilWidget.buildText(
//                   label ?? '',
//                   textColor: AppColors.colorBlack,
//                   fontWeight: FontWeight.bold,
//                   fontSize: fontSize ?? AppDimens.fontMedium(),
//                 ),
//                 UtilWidget.sizedBoxWidth5,
//                 if (isRequired)
//                   UtilWidget.buildText(
//                     '(*)',
//                     textColor: AppColors.redDark,
//                     fontWeight: FontWeight.bold,
//                     fontSize: AppDimens.fontSmall14(),
//                   ),
//               ],
//             ),
//           )
//         : const SizedBox();
//   }
//
//   @override
//   @nonVirtual
//   Widget build(BuildContext context) {
//     switch (direction) {
//       case Axis.vertical:
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // _buildLabel(),
//             // UtilWidget.sizedBox5,
//             buildField(),
//           ],
//         );
//       case Axis.horizontal:
//         return Row(
//           children: [
//             if (label!.isNotEmpty)
//               Flexible(
//                 flex: 1,
//                 child: _buildLabel(),
//               ),
//             UtilWidget.sizedBoxWidth5,
//             Expanded(flex: 2, child: buildField()),
//           ],
//         );
//     }
//   }
// }
