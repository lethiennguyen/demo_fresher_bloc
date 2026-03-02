import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/detail/domain/use_case/detail_product_use_case.dart';
import 'package:demo_fresher_bloc/feature/home/domain/domain.src.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../image_picker_load/image_picker_load.src.dart';
import 'detail_product_event.dart';
import 'detail_product_state.dart';

class DetailProductBloc
    extends BaseBloc<DetailProductEvent, DetailProductState> {
  final DetailProductUseCase useCase;
  ProductEntity entity;
  final ImageRepository repositoryImage;
  final ImageUploadRequest requestImage;
  DetailProductBloc(
      this.useCase, this.entity, this.repositoryImage, this.requestImage)
      : super(DetailProductState.initial()) {
    on<DeleteProduct>(_onDeleteProduct);
    on<FetchCategory>(_onFetchCategory);
    on<DetailProductStarted>(_onInit);
  }

  Future<void> _onDeleteProduct(
      DeleteProduct event, Emitter<DetailProductState> emit) async {}

  Future<void> _onInit(
      DetailProductStarted event, Emitter<DetailProductState> emit) async {
    add(FetchCategory());
  }

  Future<void> _onFetchCategory(
      FetchCategory event, Emitter<DetailProductState> emit) async {
    final result = await useCase.categoriesUseCase.execute();

    if (result.isNotEmpty) {
      final updated = List<CategoriesEntity>.from(state.listCategory ?? [])
        ..addAll(result);
      emit(state.copyWith(listCategory: updated));
      return;
    }
    emit(state.copyWith(errorMessage: "Lấy danh mục không thành công"));
  }
}
