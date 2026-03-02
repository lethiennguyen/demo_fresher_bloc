import 'package:demo_fresher_bloc/core/base/base_controller/base_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../home/domain/domain.src.dart';

class DetailProductState extends BaseState {
  final String url;
  final GlobalKey? formKey;
  final bool isImage;
  final bool isUploadingImage;
  final bool isDetail;
  final bool isEdit;

  final List<CategoriesEntity>? categories;
  final CategoriesEntity? selectedCategory;

  final ProductEntity? product;
  final ProductEntity? oldProduct;
  final List<CategoriesEntity>? listCategory;

  final TextEditingController? inputNameCtrl;
  final TextEditingController? inputCodeCtrl;
  final TextEditingController? inputPriceCtrl;
  final TextEditingController? inputStockCtrl;
  final TextEditingController? inputCategoryCtrl;
  final TextEditingController? descriptionCtrl;

  final FocusNode? fcsName;
  final FocusNode? fcsCode;
  final FocusNode? fcsPrice;
  final FocusNode? fcsStock;
  final FocusNode? fcsCategory;

  const DetailProductState(
      {this.url = '',
      this.isImage = false,
      this.isUploadingImage = false,
      this.isDetail = true,
      this.isEdit = false,
      this.formKey,
      this.categories,
      this.selectedCategory,
      this.inputNameCtrl,
      this.inputCodeCtrl,
      this.inputPriceCtrl,
      this.inputStockCtrl,
      this.inputCategoryCtrl,
      this.descriptionCtrl,
      this.fcsName,
      this.fcsCode,
      this.fcsPrice,
      this.fcsStock,
      this.fcsCategory,
      this.product,
      this.oldProduct,
      this.listCategory,
      super.errorMessage,
      super.isButtonLoading,
      super.isLoading,
      super.isOverlayLoading});

  factory DetailProductState.initial() {
    return DetailProductState(
      url: '',
      isImage: false,
      isUploadingImage: false,
      isDetail: true,
      inputNameCtrl: TextEditingController(),
      inputCodeCtrl: TextEditingController(),
      inputPriceCtrl: TextEditingController(),
      inputStockCtrl: TextEditingController(),
      inputCategoryCtrl: TextEditingController(),
      descriptionCtrl: TextEditingController(),
      fcsName: FocusNode(),
      fcsCode: FocusNode(),
      fcsPrice: FocusNode(),
      fcsStock: FocusNode(),
      fcsCategory: FocusNode(),
    );
  }

  @override
  DetailProductState copyWith({
    String? url,
    GlobalKey? formKey,
    bool? isImage,
    bool? isUploadingImage,
    bool? isDetail,
    bool? isEdit,
    List<CategoriesEntity>? categories,
    CategoriesEntity? selectedCategory,
    TextEditingController? inputNameCtrl,
    TextEditingController? inputCodeCtrl,
    TextEditingController? inputPriceCtrl,
    TextEditingController? inputStockCtrl,
    TextEditingController? inputCategoryCtrl,
    TextEditingController? descriptionCtrl,
    FocusNode? fcsName,
    FocusNode? fcsCode,
    FocusNode? fcsPrice,
    FocusNode? fcsStock,
    FocusNode? fcsCategory,
    ProductEntity? product,
    ProductEntity? oldProduct,
    List<CategoriesEntity>? listCategory,
    String? errorMessage,
    bool? isLoading,
    bool? isOverlayLoading,
    bool? isButtonLoading,
  }) {
    return DetailProductState(
      url: url ?? this.url,
      formKey: formKey ?? this.formKey,
      isImage: isImage ?? this.isImage,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      isDetail: isDetail ?? this.isDetail,
      isEdit: isEdit ?? this.isEdit,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      listCategory: listCategory ?? this.listCategory,
      product: product ?? this.product,
      oldProduct: oldProduct ?? this.oldProduct,
      inputNameCtrl: inputNameCtrl ?? this.inputNameCtrl,
      inputCodeCtrl: inputCodeCtrl ?? this.inputCodeCtrl,
      inputPriceCtrl: inputPriceCtrl ?? this.inputPriceCtrl,
      inputStockCtrl: inputStockCtrl ?? this.inputStockCtrl,
      inputCategoryCtrl: inputCategoryCtrl ?? this.inputCategoryCtrl,
      descriptionCtrl: descriptionCtrl ?? this.descriptionCtrl,
      fcsName: fcsName ?? this.fcsName,
      fcsCode: fcsCode ?? this.fcsCode,
      fcsPrice: fcsPrice ?? this.fcsPrice,
      fcsStock: fcsStock ?? this.fcsStock,
      fcsCategory: fcsCategory ?? this.fcsCategory,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isOverlayLoading: isOverlayLoading ?? this.isOverlayLoading,
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        url,
        isImage,
        isUploadingImage,
        isDetail,
        isEdit,
        formKey,
      ];
}
