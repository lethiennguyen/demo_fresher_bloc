import 'dart:async';

import 'package:demo_fresher_bloc/feature/home/domain/repositories/home_repository.dart';

import '../../../../core/base/base.src.dart';
import '../../../home/domain/domain.src.dart';
import '../../data/data.src.dart';
import '../domain.src.dart';

class DetailProductUseCase {
  CategoriesDetailUseCase categoriesUseCase;
  CreateProductUseCase createProductUseCase;
  CreateCategoryUseCase createCategoryUseCase;
  UpdateProductUseCase updateProductUseCase;
  DeleteProductDetailUseCase deleteProductUseCase;

  DetailProductUseCase(
      this.categoriesUseCase,
      this.createProductUseCase,
      this.createCategoryUseCase,
      this.updateProductUseCase,
      this.deleteProductUseCase);
}

class CategoriesDetailUseCase extends NoInputUseCase<List<CategoriesEntity>> {
  HomeRepository homeRepository;

  CategoriesDetailUseCase(this.homeRepository);

  @override
  FutureOr<List<CategoriesEntity>> execute() async {
    final result = await homeRepository.categories();
    return result.data ?? [];
  }
}

class CreateProductUseCase extends UseCase<ProductRequestEntity, ApiResponse> {
  DetailProductRepository repository;

  CreateProductUseCase(this.repository);

  @override
  FutureOr<ApiResponse> execute(ProductRequestEntity input) async {
    final result = await repository.create(input);
    return result;
  }
}

class UpdateProductUseCase
    extends UseCase<ProductRequestEntity, ApiResponse<bool>> {
  DetailProductRepository repository;

  UpdateProductUseCase(this.repository);

  @override
  FutureOr<ApiResponse<bool>> execute(ProductRequestEntity input) async {
    final result = await repository.updateProject(input);
    return result;
  }
}

class DeleteProductDetailUseCase
    extends UseCase<ProductRequestEntity, ApiResponse<bool>> {
  DetailProductRepository repository;

  DeleteProductDetailUseCase(this.repository);

  @override
  FutureOr<ApiResponse<bool>> execute(ProductRequestEntity input) async {
    final result = await repository.deleteProduct(input);
    return result;
  }
}

class CreateCategoryUseCase
    extends UseCase<CategoryRequestEntity, ApiResponse> {
  DetailProductRepository repository;
  CreateCategoryUseCase(this.repository);

  @override
  FutureOr<ApiResponse> execute(CategoryRequestEntity input) async {
    final result = await repository.createCategory(input);
    return result;
  }
}
