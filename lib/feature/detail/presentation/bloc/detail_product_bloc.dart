import 'package:collection/collection.dart';
import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/detail/domain/use_case/detail_product_use_case.dart';
import 'package:demo_fresher_bloc/feature/home/domain/domain.src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/values/app_string.dart';
import '../../../../lib.dart';
import '../../../image_picker_load/image_picker_load.src.dart';
import '../../domain/domain.src.dart';
import '../event/event.src.dart';
import 'detail_product_event.dart';
import 'detail_product_state.dart';

class DetailProductBloc
    extends BaseBloc<DetailProductEvent, DetailProductState> {
  final TextEditingController inputNameCtrl = TextEditingController();
  final TextEditingController inputCodeCtrl = TextEditingController();
  final TextEditingController inputPriceCtrl = TextEditingController();
  final TextEditingController inputStockCtrl = TextEditingController();
  final TextEditingController inputCategoryCtrl = TextEditingController();
  final TextEditingController descriptionCtrl = TextEditingController();

  final FocusNode fcsName = FocusNode();
  final FocusNode fcsCode = FocusNode();
  final FocusNode fcsPrice = FocusNode();
  final FocusNode fcsStock = FocusNode();
  final FocusNode fcsCategory = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DetailProductUseCase useCase;
  final ProductEntity? entity;
  final ImageRepository repositoryImage = ImageRepository();
  final ImageUploadRequest requestImage = ImageUploadRequest();
  DetailProductBloc(
    this.useCase,
    this.entity,
  ) : super(DetailProductState.initial()) {
    on<DeleteProduct>(_onDeleteProduct);
    on<FetchCategory>(_onFetchCategory);
    on<DetailStarted>(_onInit);
    on<UpImage>(upImage);
    on<UpDateProduct>(_onUpdateProduct);
    on<CreateProduct>(_onCreateProduct);
    on<CreateCategory>(createCategory);
    on<ProductUpdateOrCreate>(productUpdateOrCreate);
    on<OnBack>(onBack);
    on<DetailProductStarted>((event, emit) {});
    on<DetailCreateStarted>((event, emit) {});
    on<OnEditPressed>(onEditPressed);
    on<UpdateSelectedCategory>((event, emit) {
      emit(state.copyWith(selectedCategory: event.category));
    });

    on<ResetCreateSuccess>((event, emit) {
      emit(state.copyWith(createSuccess: false));
    });
    // on<ResetMessageSuccess>((event, emit) {
    //   emit(state.copyWith(message: null));
    // });
  }

  Future<void> _onDeleteProduct(
      DeleteProduct event, Emitter<DetailProductState> emit) async {}

  Future<void> _onInit(
      DetailStarted event, Emitter<DetailProductState> emit) async {
    emit(state.copyWith(product: entity));
    add(FetchCategory());
    if (entity == null) {
      emit(state.copyWith(isDetail: false));
      add(DetailCreateStarted());
      return;
    }
    add(DetailProductStarted(entity!));
    emit(state.copyWith(isDetail: true));
    emit(state.copyWith(oldProduct: entity));
  }

  Future<void> _onFetchCategory(
      FetchCategory event, Emitter<DetailProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final result = await useCase.categoriesUseCase.execute();

      if (result.isNotEmpty) {
        emit(state.copyWith(listCategory: []));
        final updated = List<CategoriesEntity>.from(state.listCategory ?? [])
          ..addAll(result);
        emit(state.copyWith(listCategory: updated));
        return;
      }
      emit(state.copyWith(
        message: "Lấy danh mục không thành công",
        messageId: DateTime.now().millisecondsSinceEpoch,
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> upImage(UpImage event, Emitter<DetailProductState> emit) async {
    try {
      final upImage = await repositoryImage.pickImage(ImageSource.gallery);
      if (upImage == null) return;
      emit(state.copyWith(
        url: upImage.path,
        isUploadingImage: true,
      ));
      requestImage
        ..imagePath = upImage.path
        ..uploadPreset = repositoryImage.uploadPreset;

      print(requestImage.imagePath);
      final urlImage = await repositoryImage.uploadToCloudinary(requestImage);
      if (urlImage == null) return;
      emit(state.copyWith(isImage: true, url: urlImage));
    } on Exception catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    } finally {
      emit(state.copyWith(isUploadingImage: false));
    }
  }

  void fillForm(Emitter<DetailProductState> emit,
      {ProductEntity? productEntity}) {
    inputNameCtrl.text = productEntity?.name ?? "";
    inputCodeCtrl.text = productEntity?.code ?? "";
    inputPriceCtrl.text = productEntity?.price?.toString() ?? "";
    inputStockCtrl.text = productEntity?.stock?.toString() ?? "";
    descriptionCtrl.text = productEntity?.description ?? "";
    emit(state.copyWith(url: productEntity?.image ?? "", isImage: true));

    if (productEntity?.category != null) {
      final category = state.listCategory
          ?.firstWhereOrNull((e) => e.id == productEntity?.category?.id);
      emit(state.copyWith(selectedCategory: category));
      inputCategoryCtrl.text = category?.name ?? "";
    }
  }

  void onEditPressed(OnEditPressed event, Emitter<DetailProductState> emit) {
    if (state.product == null) return;

    emit(state.copyWith(isDetail: false));
    inputNameCtrl.text = state.product!.name ?? "";
    inputCodeCtrl.text = state.product!.code ?? "";
    inputPriceCtrl.text = state.product!.price?.toString() ?? "";
    inputStockCtrl.text = state.product!.stock?.toString() ?? "";
    descriptionCtrl.text = state.product!.description ?? "";
    emit(state.copyWith(
        url: state.product?.image ?? "", isImage: true, isEdit: true));

    if (state.product?.category != null) {
      emit(state.copyWith(selectedCategory: state.product?.category));
      inputCategoryCtrl.text = state.product?.category?.name ?? "";
    }
  }

  Future<void> createCategory(
      CreateCategory event, Emitter<DetailProductState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final entity = CategoryRequestEntity(
        name: inputCategoryCtrl.text.trim(),
      );
      final result = await useCase.createCategoryUseCase.execute(entity);
      if (result.data != null) {
        onRefreshCategory();
        add(FetchCategory());
        return;
      }
    } catch (e) {
      emit(state.copyWith(
        message: LocaleKeys.add_tasks_add_category,
        messageId: DateTime.now().millisecondsSinceEpoch,
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void productUpdateOrCreate(
      ProductUpdateOrCreate event, Emitter<DetailProductState> emit) {
    if (state.isEdit) {
      add(UpDateProduct());
    } else {
      add(CreateProduct());
    }
  }

  void onRefreshProduct() {
    EventBusUtils().fire(DeleteProductEvent());
  }

  void onRefreshCategory() {
    EventBusUtils().fire(CreateCategoryEvent());
  }

  void onUpImage(Emitter<DetailProductState> emit) {
    if (state.url.isEmpty) {
      emit(state.copyWith(
        message: "Vui lòng chọn ảnh",
        messageId: DateTime.now().millisecondsSinceEpoch,
      ));
    }
  }

  Future<void> _onUpdateProduct(
      UpDateProduct event, Emitter<DetailProductState> emit) async {
    onUpImage(emit);
    if (!(formKey.currentState?.validate() ?? false)) return;
    if (state.isUploadingImage) {
      emit(state.copyWith(
        message: LocaleKeys.add_tasks_image,
        messageId: DateTime.now().millisecondsSinceEpoch,
      ));
      return;
    }
    emit(state.copyWith(isOverlayLoading: true));
    try {
      final entity = ProductRequestEntity(
        id: state.product?.id,
        name: inputNameCtrl.text.trim(),
        code: inputCodeCtrl.text.trim(),
        price: double.parse(inputPriceCtrl.text.replaceAll(',', '').trim()),
        stock: int.parse(inputStockCtrl.text.trim()),
        categoryId: state.selectedCategory?.id ?? 0,
        description: descriptionCtrl.text.trim(),
        image: state.url,
      );

      final result = await useCase.updateProductUseCase.execute(entity);

      if (result.data!) {
        // cập nhật lại productEntity theo dữ liệu mới
        final productUpdate = state.product?.copyWith(
          name: entity.name,
          code: entity.code,
          price: entity.price,
          stock: entity.stock,
          description: entity.description,
          category: state.selectedCategory,
          image: state.url,
        );

        emit(state.copyWith(
          product: productUpdate,
          oldProduct: productUpdate,
          isDetail: true,
        ));

        emit(state.copyWith(
          message: LocaleKeys.add_tasks_update_task,
          messageId: DateTime.now().millisecondsSinceEpoch,
        ));
        onRefreshProduct();
      } else {
        // rollback form về dữ liệu cũ
        if (state.oldProduct != null) {
          fillForm(emit, productEntity: state.oldProduct!);
        }
        emit(state.copyWith(
          message: LocaleKeys.add_tasks_update_task_failed,
          messageId: DateTime.now().millisecondsSinceEpoch,
        ));
      }
    } finally {
      emit(state.copyWith(isOverlayLoading: false));
    }
  }

  Future<void> _onCreateProduct(
      CreateProduct event, Emitter<DetailProductState> emit) async {
    onUpImage(emit);
    if (state.isUploadingImage) {
      emit(state.copyWith(
        message: LocaleKeys.add_tasks_image,
        messageId: DateTime.now().millisecondsSinceEpoch,
      ));
      return;
    }
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(state.copyWith(isOverlayLoading: true));
    try {
      final entity = ProductRequestEntity(
        name: inputNameCtrl.text.trim(),
        code: inputCodeCtrl.text.trim(),
        price: double.parse(inputPriceCtrl.text.trim()),
        stock: int.parse(inputStockCtrl.text.trim()),
        categoryId: state.selectedCategory?.id ?? 0,
        description: descriptionCtrl.text.trim(),
        image: state.url,
      );

      final result = await useCase.createProductUseCase.execute(entity);

      if (result.data != null) {
        onRefreshProduct();

        /// để cập nhật lại state tạo xong sẽ quay lại màn hình
        add(OnBack());
        emit(state.copyWith(
          message: LocaleKeys.add_tasks_create_task,
          messageId: DateTime.now().millisecondsSinceEpoch,
        ));
      } else {
        emit(state.copyWith(
          message: result.message ?? LocaleKeys.add_tasks_create_task_failed,
          messageId: DateTime.now().millisecondsSinceEpoch,
        ));
      }
    } finally {
      emit(state.copyWith(isOverlayLoading: false));
    }
  }

  void onBack(OnBack event, Emitter<DetailProductState> emit) {
    if (state.isDetail) {
      emit(state.copyWith(createSuccess: true));
      return;
    }
    if (state.isEdit) {
      emit(state.copyWith(isDetail: true, isEdit: false));
      fillForm(emit, productEntity: state.oldProduct);
      return;
    }
    if (!state.isDetail && !state.isEdit) {
      emit(state.copyWith(createSuccess: true));
      return;
    }
  }

  String get title {
    if (state.isDetail) {
      return LocaleKeys.add_tasks_detail_task;
    }
    if (state.isEdit) {
      return LocaleKeys.add_tasks_update_task;
    }
    return LocaleKeys.add_tasks_create_task;
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.product_validate_name_empty;
    }
    if (value.trim().length < 3) {
      return LocaleKeys.product_validate_name_min_length;
    }
    return null;
  }

  String? validateCode(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.product_validate_code_empty;
    }
    if (value.trim().length < 3) {
      return LocaleKeys.product_validate_code_min_length;
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.product_validate_price_empty;
    }

    final price = double.tryParse(value.replaceAll(',', '').trim());
    if (price == null) {
      return LocaleKeys.product_validate_price_invalid;
    }

    if (price <= 0) {
      return LocaleKeys.product_validate_price_positive;
    }

    return null;
  }

  String? validateStock(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.product_validate_stock_empty;
    }

    final stock = int.tryParse(value.trim());
    if (stock == null) {
      return LocaleKeys.product_validate_stock_invalid;
    }

    if (stock < 0) {
      return LocaleKeys.product_validate_stock_negative;
    }

    return null;
  }

  String? validateCategory(String? value) {
    if (value == null || value.trim().isEmpty) {
      return LocaleKeys.product_validate_category_empty;
    }
    return null;
  }
}
