// import 'dart:async';
//
// import 'package:demo_fresher_bloc/core/base/base.src.dart';
// import 'package:demo_fresher_bloc/shared/widgets/show_popup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../../generated/locales.g.dart';
// import '../../../../lib.dart';
// import '../../../home/domain/domain.src.dart';
// import '../../../image_picker_load/image_picker_load.src.dart';
// import '../../domain/domain.src.dart';
// import '../../domain/use_case/use_case.src.dart';
// import '../event/event.src.dart';
//
// class DetailProductController extends BaseGetxController {
//   DetailProductUseCase useCase;
//   ProductEntity? productEntity;
//
//   DetailProductController(this.useCase, this.productEntity);
//
//   TextEditingController inputNameCtrl = TextEditingController();
//   TextEditingController inputCodeCtrl = TextEditingController();
//   TextEditingController inputPriceCtrl = TextEditingController();
//   TextEditingController inputStockCtrl = TextEditingController();
//   TextEditingController inputCategoryCtrl = TextEditingController();
//   TextEditingController descriptionCtrl = TextEditingController();
//
//   /// image
//   late final ImageRepository _repositoryImage = ImageRepository(this);
//   final ImageUploadRequest _requestImage = ImageUploadRequest();
//   final RxString url = ''.obs;
//   final RxBool isImage = false.obs;
//   final RxBool isUploadingImage =
//       false.obs; // lắng nghe xem ảnh có đang tải hay không
//
//   Rx<FocusNode> fcsName = FocusNode().obs;
//   Rx<FocusNode> fcsCode = FocusNode().obs;
//   Rx<FocusNode> fcsPrice = FocusNode().obs;
//   Rx<FocusNode> fcsStock = FocusNode().obs;
//   Rx<FocusNode> fcsCategory = FocusNode().obs;
//   final formKey = GlobalKey<FormState>();
//
//   final listCategory = RxList<CategoriesEntity>();
//   final selectedCategory = Rx<CategoriesEntity?>(null);
//
//   final RxBool isDetail = false.obs;
//   final RxBool isEdit = false.obs;
//
//   ProductEntity? _oldProduct;
//
//   @override
//   void onInit() async {
//     super.onInit();
//
//     if (productEntity == null) {
//       isDetail.value = false;
//       await fetchCategory();
//       return;
//     }
//
//     isDetail.value = true;
//
//     // giữ snapshot để rollback nếu fail
//     _oldProduct = productEntity;
//
//     await fetchCategory();
//   }
//
//   Future<void> upImage() async {
//     try {
//       final upImage = await _repositoryImage.pickImage(ImageSource.gallery);
//       if (upImage == null) return;
//       isUploadingImage.value = true;
//       _requestImage
//         ..imagePath = upImage.path
//         ..uploadPreset = _repositoryImage.uploadPreset;
//
//       final urlImage = await _repositoryImage.uploadToCloudinary(_requestImage);
//       if (urlImage == null) return;
//       isImage.value = true;
//       url.value = urlImage;
//     } finally {
//       isUploadingImage.value = false;
//     }
//   }
//
//   void _fillForm({ProductEntity? productEntity}) {
//     inputNameCtrl.text = productEntity?.name ?? "";
//     inputCodeCtrl.text = productEntity?.code ?? "";
//     inputPriceCtrl.text = productEntity?.price?.toString() ?? "";
//     inputStockCtrl.text = productEntity?.stock?.toString() ?? "";
//     descriptionCtrl.text = productEntity?.description ?? "";
//     url.value = productEntity?.image ?? "";
//     isImage.value = url.value.isNotEmpty;
//
//     if (productEntity?.category != null) {
//       selectedCategory.value = listCategory
//           .firstWhereOrNull((e) => e.id == productEntity?.category?.id);
//       inputCategoryCtrl.text = selectedCategory.value?.name ?? "";
//     }
//   }
//
//   void onEditPressed() {
//     if (productEntity == null) return;
//
//     isDetail.value = false;
//
//     inputNameCtrl.text = productEntity!.name ?? "";
//     inputCodeCtrl.text = productEntity!.code ?? "";
//     inputPriceCtrl.text = productEntity!.price?.toString() ?? "";
//     inputStockCtrl.text = productEntity!.stock?.toString() ?? "";
//     descriptionCtrl.text = productEntity!.description ?? "";
//     url.value = productEntity!.image ?? "";
//     isImage.value = url.value.isNotEmpty;
//     isEdit.value = true;
//
//     if (productEntity!.category != null) {
//       selectedCategory.value = productEntity!.category;
//       inputCategoryCtrl.text = selectedCategory.value?.name ?? "";
//     }
//   }
//
//   Future<void> fetchCategory() async {
//     final result = await useCase.categoriesUseCase.execute();
//     if (result.isNotEmpty) {
//       listCategory.assignAll(result);
//     } else {
//       UtilWidget.showSnackBar(
//         title: LocaleKeys.notification_title.tr,
//         message: "Lấy danh mục không thành công",
//       );
//     }
//   }
//
//   Future<void> createCategory() async {
//     showLoading();
//     try {
//       final entity = CategoryRequestEntity(
//         name: inputCategoryCtrl.text.trim(),
//       );
//       final result = await useCase.createCategoryUseCase.execute(entity);
//       if (result.data != null) {
//         onRefreshCategory();
//         await fetchCategory();
//         return;
//       }
//     } catch (e) {
//       UtilWidget.showSnackBar(
//         title: LocaleKeys.notification_title.tr,
//         message: "Thêm danh mục không thành công",
//       );
//     } finally {
//       hideLoading();
//     }
//   }
//
//   Future<void> deleteCategory(CategoriesEntity item) async {}
//
//   void onRefreshProduct() {
//     EventBusUtils().fire(DeleteProductEvent());
//   }
//
//   void onRefreshCategory() {
//     EventBusUtils().fire(CreateCategoryEvent());
//   }
//
//   void showDialogDelete() {
//     UtilWidget.showConfirmDialog(
//       title: "Xóa sản phẩm",
//       subtitle: "Bạn có muỗn xóa không",
//       typeAction: AppConst.actionFail,
//       onCancel: () => Get.back(),
//       onConfirm: () {
//         Get.back();
//         deleteProduct();
//       },
//     );
//   }
//
//   Future<void> deleteProduct() async {
//     showLoadingOverlay();
//     try {
//       final result = await useCase.deleteProductUseCase
//           .execute(ProductRequestEntity(id: productEntity?.id));
//       if (result.data!) {
//         onRefreshProduct();
//         Get.back();
//         UtilWidget.showSnackBar(
//           title: LocaleKeys.notification_title.tr,
//           message: "Xóa sản phẩm thành công",
//         );
//       } else {
//         UtilWidget.showSnackBar(
//           title: LocaleKeys.notification_title.tr,
//           message: "Xóa sản phẩm không thành công",
//         );
//       }
//     } finally {
//       hideLoadingOverlay();
//     }
//   }
//
//   Future<void> upDateProduct() async {
//     onUpImage();
//     if (!(formKey.currentState?.validate() ?? false)) return;
//     if (isUploadingImage.value) {
//       UtilWidget.showSnackBar(
//         title: LocaleKeys.notification_title.tr,
//         message: "Ảnh đang trong quá trình tải",
//       );
//       return;
//     }
//     showLoadingOverlay();
//     try {
//       final entity = ProductRequestEntity(
//         id: productEntity?.id,
//         name: inputNameCtrl.text.trim(),
//         code: inputCodeCtrl.text.trim(),
//         price: double.parse(inputPriceCtrl.text.replaceAll(',', '').trim()),
//         stock: int.parse(inputStockCtrl.text.trim()),
//         categoryId: selectedCategory.value?.id ?? 0,
//         description: descriptionCtrl.text.trim(),
//         image: url.value,
//       );
//
//       final result = await useCase.updateProductUseCase.execute(entity);
//
//       if (result.data!) {
//         // cập nhật lại productEntity theo dữ liệu mới
//         productEntity = productEntity?.copyWith(
//           name: entity.name,
//           code: entity.code,
//           price: entity.price,
//           stock: entity.stock,
//           description: entity.description,
//           category: selectedCategory.value,
//           image: url.value,
//         );
//
//         // update snapshot
//         _oldProduct = productEntity;
//
//         UtilWidget.showSnackBar(
//           title: LocaleKeys.notification_title.tr,
//           message: LocaleKeys.add_tasks_update_task.tr,
//         );
//         onRefreshProduct();
//         isDetail.value = true;
//       } else {
//         // rollback form về dữ liệu cũ
//         if (_oldProduct != null) {
//           _fillForm(productEntity: _oldProduct!);
//         }
//
//         UtilWidget.showSnackBar(
//           title: LocaleKeys.notification_title.tr,
//           message: LocaleKeys.add_tasks_update_task_failed.tr,
//         );
//       }
//     } finally {
//       hideLoadingOverlay();
//     }
//   }
//
//   Future<void> createProduct() async {
//     onUpImage();
//     if (isUploadingImage.value) {
//       UtilWidget.showSnackBar(
//         title: LocaleKeys.notification_title.tr,
//         message: "Ảnh đang trong quá trình tải",
//       );
//       return;
//     }
//     if (!(formKey.currentState?.validate() ?? false)) return;
//
//     showLoadingOverlay();
//     try {
//       final entity = ProductRequestEntity(
//         name: inputNameCtrl.text.trim(),
//         code: inputCodeCtrl.text.trim(),
//         price: double.parse(inputPriceCtrl.text.replaceAll(',', '').trim()),
//         stock: int.parse(inputStockCtrl.text.trim()),
//         categoryId: selectedCategory.value?.id ?? 0,
//         description: descriptionCtrl.text.trim(),
//         image: url.value,
//       );
//
//       final result = await useCase.createProductUseCase.execute(entity);
//
//       if (result.data != null) {
//         onRefreshProduct();
//         Get.back();
//
//         UtilWidget.showSnackBar(
//           title: LocaleKeys.notification_title.tr,
//           message: LocaleKeys.add_tasks_create_task.tr,
//         );
//       } else {
//         UtilWidget.showSnackBar(
//           title: LocaleKeys.notification_title.tr,
//           message: result.message ?? LocaleKeys.add_tasks_create_task_failed.tr,
//         );
//       }
//     } finally {
//       hideLoadingOverlay();
//     }
//   }
//
//   void onBack() {
//     if (isDetail.value) {
//       Get.back();
//     }
//     if (isEdit.value) {
//       isDetail.value = true;
//       isEdit.value = false;
//       _fillForm(productEntity: _oldProduct);
//     }
//     if (!isDetail.value && !isEdit.value) {
//       Get.back();
//     }
//   }
//
//   void onUpImage() {
//     if (url.value.isEmpty) {
//       ShowPopup.showDialogNotificationError("Vui lòng chọn ảnh",
//           code: AppConst.error500);
//     }
//   }
//
//   String get title {
//     if (isDetail.value) {
//       return LocaleKeys.add_tasks_detail_task.tr;
//     }
//     if (isEdit.value) {
//       return LocaleKeys.add_tasks_update_task.tr;
//     }
//     return LocaleKeys.add_tasks_create_task.tr;
//   }
//
//   String? validateName(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return "Vui lòng nhập tên sản phẩm";
//     }
//     if (value.trim().length < 3) {
//       return "Tên phải có ít nhất 3 ký tự";
//     }
//     return null;
//   }
//
//   String? validateCode(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return "Vui lòng nhập mã sản phẩm";
//     }
//     if (value.trim().length < 3) {
//       return "Mã sản phẩm quá ngắn";
//     }
//     return null;
//   }
//
//   String? validatePrice(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return "Vui lòng nhập giá sản phẩm";
//     }
//
//     final price = double.tryParse(value.replaceAll(',', '').trim());
//     if (price == null) {
//       return "Giá phải là số hợp lệ";
//     }
//
//     if (price <= 0) {
//       return "Giá phải lớn hơn 0";
//     }
//
//     return null;
//   }
//
//   String? validateStock(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return "Vui lòng nhập số lượng";
//     }
//
//     final stock = int.tryParse(value.trim());
//     if (stock == null) {
//       return "Số lượng phải là số nguyên";
//     }
//
//     if (stock < 0) {
//       return "Số lượng không được âm";
//     }
//
//     return null;
//   }
//
//   String? validateCategory(String? value) {
//     if (value == null || value.trim().isEmpty) {
//       return "Vui lòng nhập danh mục";
//     }
//     return null;
//   }
// }
