import 'dart:async';

import 'package:demo_fresher_bloc/feature/home/domain/repositories/home_repository.dart';
import 'package:hive/hive.dart';

import '../../../../core/core.src.dart';
import '../../../detail/domain/domain.src.dart';
import '../../../detail/domain/use_case/use_case.src.dart';
import '../domain.src.dart';

class HomeUseCase {
  final ListProductItemUseCase listProductItemUseCase;
  final CategoriesUseCase categoriesUseCase;
  final DeleteProductUseCase deleteProductUseCase;
  final DeleteCategoryUseCase deleteCategoryUseCase;
  final CreateCategoryUseCase createCategoryUseCase;
  final UpdateCategoryUseCase updateCategoryUseCase;
  final LogoutUseCase logoutUseCase;

  HomeUseCase(
    this.listProductItemUseCase,
    this.categoriesUseCase,
    this.deleteProductUseCase,
    this.deleteCategoryUseCase,
    this.createCategoryUseCase,
    this.updateCategoryUseCase,
    this.logoutUseCase,
  );
}

class ListProductItemUseCase
    extends UseCase<ListProductRequestEntity, List<ProductEntity>?> {
  HomeRepository homeRepository;
  ListProductItemUseCase(this.homeRepository);
  @override
  FutureOr<List<ProductEntity>?> execute(ListProductRequestEntity input) async {
    final result = await homeRepository.lisProductItem(input);
    return result.data;
  }
}

class CategoriesUseCase extends NoInputUseCase<List<CategoriesEntity>> {
  HomeRepository homeRepository;
  CategoriesUseCase(this.homeRepository);

  @override
  FutureOr<List<CategoriesEntity>> execute() async {
    final result = await homeRepository.categories();
    return result.data!;
  }
}

class DeleteProductUseCase
    extends UseCase<DeleteProductEntity, BaseResponse<bool>> {
  HomeRepository homeRepository;
  DeleteProductUseCase(this.homeRepository);
  @override
  FutureOr<BaseResponse<bool>> execute(DeleteProductEntity input) async {
    final result = await homeRepository.deleteProduct(input);
    return result;
  }
}

class DeleteCategoryUseCase
    extends UseCase<DeleteCategoryEntity, BaseResponse<bool>> {
  HomeRepository homeRepository;
  DeleteCategoryUseCase(this.homeRepository);
  @override
  FutureOr<BaseResponse<bool>> execute(DeleteCategoryEntity input) async {
    final result = await homeRepository.deleteCategory(input);
    return result;
  }
}

class UpdateCategoryUseCase
    extends UseCase<CategoryRequestEntity, BaseResponse> {
  HomeRepository homeRepository;
  UpdateCategoryUseCase(this.homeRepository);
  @override
  FutureOr<BaseResponse> execute(CategoryRequestEntity input) async {
    final result = await homeRepository.updateCategory(input);
    return result;
  }
}

class LogoutUseCase extends NoInputUseCase<bool> {
  @override
  Future<bool> execute() async {
    try {
      final authBox = await Hive.openBox(HiveBoxNames.auth);
      await authBox.put(HiveKeys.token, '');
      return true;
    } catch (e) {
      return false;
    }
  }
}
