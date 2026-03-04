import 'package:demo_fresher_bloc/core/base/base_controller/base_state.dart';
import 'package:flutter/cupertino.dart';

import '../../../home/domain/domain.src.dart';

class DetailProductState extends BaseState {
  final String url;
  final bool isImage;
  final bool isUploadingImage;
  final bool isDetail;
  final bool isEdit;

  final List<CategoriesEntity>? categories;
  final CategoriesEntity? selectedCategory;

  final ProductEntity? product;
  final ProductEntity? oldProduct;
  final List<CategoriesEntity>? listCategory;

  final bool createSuccess;

  const DetailProductState(
      {this.url = '',
      this.isImage = false,
      this.isUploadingImage = false,
      this.isDetail = true,
      this.isEdit = false,
      this.categories,
      this.selectedCategory,
      this.product,
      this.oldProduct,
      this.listCategory,
      this.createSuccess = false,
      super.errorMessage,
      super.isButtonLoading,
      super.isLoading,
      super.isOverlayLoading,
      super.message,
        super.messageId,
      });

  factory DetailProductState.initial() {
    return DetailProductState(
      url: '',
      isImage: false,
      isUploadingImage: false,
      isDetail: false,
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
    ProductEntity? product,
    ProductEntity? oldProduct,
    List<CategoriesEntity>? listCategory,
    bool? createSuccess,
    String? errorMessage,
    String? message,
    int? messageId,
    bool? isLoading,
    bool? isOverlayLoading,
    bool? isButtonLoading,
  }) {
    return DetailProductState(
      url: url ?? this.url,
      isImage: isImage ?? this.isImage,
      isUploadingImage: isUploadingImage ?? this.isUploadingImage,
      isDetail: isDetail ?? this.isDetail,
      isEdit: isEdit ?? this.isEdit,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      listCategory: listCategory ?? this.listCategory,
      product: product ?? this.product,
      createSuccess: createSuccess ?? this.createSuccess,
      message: message ?? this.message,
      messageId: messageId ?? this.messageId,
      oldProduct: oldProduct ?? this.oldProduct,
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
        categories,
        selectedCategory,
        product,
        oldProduct,
        listCategory,
        createSuccess,
        message,
        messageId,
        errorMessage,
        isLoading,
        isOverlayLoading,
        isButtonLoading,
      ];
}
