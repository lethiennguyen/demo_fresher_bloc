// part of 'detail_product_page.dart';
//
// Widget _buildBody(DetailProductController controller) {
//   return SingleChildScrollView(
//     child: Form(
//       key: controller.formKey,
//       child: Column(
//         children: [
//           buildImage(controller),
//           sdsSBHeight16,
//           buildNameProduct(controller),
//           sdsSBHeight16,
//           buildCodeProduct(controller),
//           sdsSBHeight16,
//           buildPriceProduct(controller),
//           sdsSBHeight16,
//           buildStockProduct(controller),
//           sdsSBHeight16,
//           buildCategoryProduct(controller),
//           sdsSBHeight16,
//           buildDescriptionProduct(controller),
//         ],
//       ).paddingAll(AppDimens.padding16),
//     ),
//   );
// }
//
// Widget buildImagePicker(DetailProductController controller) {
//   return DottedBorder(
//     color: Colors.grey,
//     strokeWidth: 1,
//     dashPattern: const [6, 4],
//     borderType: BorderType.RRect,
//     radius: const Radius.circular(12),
//     child: GestureDetector(
//         onTap: () {
//           controller.upImage();
//         },
//         child: Stack(
//           children: [
//             controller.isImage.value
//                 ? buildDetailImage(controller.url.value)
//                 : Container(
//                     width: double.infinity,
//                     height: 150,
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         CircleAvatar(
//                           radius: 25,
//                           backgroundColor: Colors.blue,
//                           child: Icon(Icons.image, color: Colors.white),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "Thêm ảnh",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ],
//                     )),
//
//             /// Loading overlay
//             if (controller.isUploadingImage.value)
//               Positioned.fill(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.basicWhite,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: const Center(
//                     child: CircularProgressIndicator(
//                       color: AppColors.mainColors,
//                     ),
//                   ),
//                 ),
//               )
//           ],
//         )),
//   );
// }
//
// Widget buildImage(DetailProductController controller) {
//   return Container(
//     width: double.infinity,
//     height: 200,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//     ),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         buildImagePicker(controller),
//       ],
//     ),
//   );
// }
//
// Widget buildNameProduct(DetailProductController controller) {
//   return SDSInputWithLabel.buildInputData(
//     validator: controller.validateName,
//     heightInput: AppDimens.height45,
//     textEditingController: controller.inputNameCtrl,
//     currentNode: controller.fcsName,
//     hintText: "Tên sản phẩm",
//     title: "Tên sản phẩm",
//     borderRadius: AppDimens.borderRadiusBig,
//     paddingBottom: 0,
//     isValidate: false,
//     isValidateText: true,
//     onChanged: (_) {},
//   ).paddingSymmetric(vertical: AppDimens.padding2);
// }
//
// Widget buildCodeProduct(DetailProductController controller) {
//   return SDSInputWithLabel.buildInputData(
//     validator: controller.validateCode,
//     heightInput: AppDimens.height45,
//     textEditingController: controller.inputCodeCtrl,
//     currentNode: controller.fcsCode,
//     hintText: "Mã code sản phẩm",
//     title: "Mã code sản phẩm",
//     borderRadius: AppDimens.borderRadiusBig,
//     paddingBottom: 0,
//     isValidate: false,
//     isValidateText: true,
//     onChanged: (_) {},
//   ).paddingSymmetric(vertical: AppDimens.padding2);
// }
//
// Widget buildPriceProduct(DetailProductController controller) {
//   return SDSInputWithLabel.buildInputData(
//     validator: controller.validatePrice,
//     heightInput: AppDimens.height45,
//     textEditingController: controller.inputPriceCtrl,
//     currentNode: controller.fcsPrice,
//     title: "Giá sản phẩm",
//     hintText: "Giá sản phẩm (VND)",
//     borderRadius: AppDimens.borderRadiusBig,
//     textInputType: TextInputType.number,
//     paddingBottom: 0,
//     isValidate: false,
//     isValidateText: true,
//     onChanged: (_) {},
//   ).paddingSymmetric(vertical: AppDimens.padding2);
// }
//
// Widget buildStockProduct(DetailProductController controller) {
//   return SDSInputWithLabel.buildInputData(
//     validator: controller.validateStock,
//     heightInput: AppDimens.height45,
//     textEditingController: controller.inputStockCtrl,
//     currentNode: controller.fcsStock,
//     title: "Số lượng sản phẩm",
//     hintText: "Số lượng sản phẩm",
//     borderRadius: AppDimens.borderRadiusBig,
//     textInputType: TextInputType.number,
//     paddingBottom: 0,
//     isValidate: false,
//     isValidateText: true,
//     onChanged: (_) {},
//   ).paddingSymmetric(vertical: AppDimens.padding2);
// }
//
// Widget buildDescriptionProduct(DetailProductController controller) {
//   return IconLeadingTextField(
//     label: "Mô tả",
//     controller: controller.descriptionCtrl,
//     backgroundColor: AppColors.basicWhite,
//   );
// }
//
// Widget buildCategoryProduct(DetailProductController controller) {
//   return Obx(() {
//     final selectedValue = controller.selectedCategory.value;
//     final Color color =
//         selectedValue == null ? AppColors.basicGrey2 : AppColors.mainColors;
//     final Color textColor =
//         selectedValue == null ? AppColors.basicBlack : AppColors.mainColors;
//     return UtilWidget.baseDropDownBottomSheetFilter(
//         height: AppDimens.height45,
//         title: "Danh mục sản phẩm",
//         borderColor: color,
//         iconColor: textColor,
//         textColor: textColor,
//         backgroundColor:
//             selectedValue == null ? AppColors.basicGrey5 : AppColors.basicWhite,
//         value: selectedValue?.name ?? "Danh mục",
//         onTap: () async {
//           if (controller.listCategory.isEmpty) {
//             await controller.fetchCategory();
//           }
//           final result = await Get.bottomSheet(
//             buildBottomSheetCategoryProduct(controller),
//             isScrollControlled: true,
//           );
//           if (result == null) {
//             controller.selectedCategory.value;
//           }
//           return result;
//         });
//   });
// }
//
// Widget buildBottomSheetCategoryProduct(DetailProductController controller) {
//   return Obx(
//     () => SizedBox(
//       height: Get.height * 0.7,
//       child: UtilWidget.buildSelectionBottomSheet(
//         title: "Chọn danh mục",
//         items: controller.listCategory,
//         isAddItem: true,
//         addItem: "Thêm danh mục +",
//         onTap: () {
//           ShowPopup.showDiaLogTextField(
//             "Thêm Danh mục",
//             "Lưu",
//             onConfirm: () {
//               controller.createCategory();
//               Get.back();
//             },
//             hintText: "Danh mục mới",
//             isActiveBack: true,
//             controller.inputCategoryCtrl,
//             controller.fcsCategory,
//           );
//         },
//         isLoading: controller.isShowLoading.value,
//         checkSelected: (item) => controller.selectedCategory.value == item,
//         itemTitleMapper: (item) => item.name ?? '',
//         onItemSelected: (item) => controller.selectedCategory.value = item,
//         onConfirm: () {
//           Get.back();
//         },
//       ),
//     ),
//   );
// }
//
// Widget buildBottomBar(DetailProductController controller) {
//   return Container(
//     decoration: BoxDecoration(
//       border: Border(
//         top: BorderSide(
//           color: AppColors.grey,
//           width: 0.5,
//         ),
//       ),
//       color: AppColors.basicWhite,
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Spacer(),
//         ButtonUtils.buildButton(
//           width: 120,
//           "Lưu",
//           () {
//             if (controller.isEdit.value) {
//               controller.upDateProduct();
//             } else {
//               controller.createProduct();
//             }
//           },
//           backgroundColor: AppColors.mainColors,
//           showLoading: true,
//           colorText: AppColors.basicWhite,
//           height: AppDimens.btnMediumTbSmall,
//           borderRadius: BorderRadius.circular(AppDimens.radius12),
//         ).paddingAll(AppDimens.padding16),
//       ],
//     ),
//   );
// }
