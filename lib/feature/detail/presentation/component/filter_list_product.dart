// import 'package:demo_fresher_bloc/lib.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../../../../generated/locales.g.dart';
//
// class FilterListProduct {
//   static Widget fillter({
//     Widget? widget,
//     VoidCallback? onConfirm,
//     VoidCallback? onCancel,
//     String? title,
//   }) {
//     return Container(
//       height: Get.height * 0.3,
//       decoration: BoxDecoration(
//           color: AppColors.basicWhite,
//           border: Border(
//             bottom: BorderSide(
//               color: AppColors.textColorGrey,
//               width: 0.5,
//             ),
//           )),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextUtils(
//             text: title ?? "",
//             availableStyle: StyleEnum.t16Bold,
//           ),
//           sdsSBHeight15,
//           Expanded(child: widget ?? SizedBox()),
//           sdsSBHeight15,
//           Row(
//             children: [
//               Expanded(
//                 child: ButtonUtils.buildButton(
//                   LocaleKeys.button_cancel.tr,
//                   onCancel ??
//                       () {
//                         Get.back();
//                       },
//                   backgroundColor: AppColors.basicWhite,
//                   showLoading: true,
//                   colorText: AppColors.mainColors,
//                   height: AppDimens.btnMediumTbSmall,
//                   borderRadius: BorderRadius.circular(AppDimens.radius12),
//                   border: Border.all(color: AppColors.mainColors),
//                 ),
//               ),
//               sdsSBWidth16,
//               Expanded(
//                 child: ButtonUtils.buildButton(
//                   LocaleKeys.button_confirm.tr,
//                   onConfirm ?? () {},
//                   backgroundColor: AppColors.mainColors,
//                   showLoading: true,
//                   colorText: AppColors.basicWhite,
//                   height: AppDimens.btnMediumTbSmall,
//                   borderRadius: BorderRadius.circular(AppDimens.radius12),
//                 ),
//               ),
//             ],
//           ),
//           sdsSBHeight15,
//         ],
//       ).paddingAll(AppDimens.padding16),
//     );
//   }
// }
