import 'package:demo_fresher_bloc/core/base/base_reponse/base_response.dart';
import 'package:demo_fresher_bloc/feature/detail/domain/entities/category_request_entity.dart';
import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';
import 'package:demo_fresher_bloc/feature/home/domain/repositories/home_repository.dart';

import '../../domain/domain.src.dart';
import '../../mapper/mapper.src.dart';

class HomeRepoImpl extends HomeRepository {
  HomeMapper mapper;
  HomeDataSources homeDataSources;

  HomeRepoImpl(this.mapper, this.homeDataSources);

  @override
  Future<ApiResponseList<CategoriesEntity>> categories() async {
    final result = await homeDataSources.categories();
    return ApiResponseList(
      data: result.data
          ?.map((e) => mapper.categoriesDataMapper.mapToEntity(e))
          .toList(),
      errorKey: result.errorKey,
      statusCode: result.statusCode,
      message: result.message,
    );
  }

  @override
  Future<ApiResponseList<ProductEntity>> lisProductItem(
      ListProductRequestEntity entity) async {
    final result = await homeDataSources.lisProductItem(entity);
    return ApiResponseList(
      data:
          result.data?.map((e) => mapper.productMapper.mapToEntity(e)).toList(),
      errorKey: result.errorKey,
      statusCode: result.statusCode,
      message: result.message,
    );
  }

  @override
  Future<ApiResponse<bool>> deleteProduct(DeleteProductEntity entity) async {
    final result = await homeDataSources.deleteProject(entity);
    return result;
  }

  @override
  Future<ApiResponse<bool>> deleteCategory(DeleteCategoryEntity entity) async {
    final result = await homeDataSources.deleteCategory(entity);
    return result;
  }

  @override
  Future<ApiResponse> updateCategory(CategoryRequestEntity entity) async {
    final result = await homeDataSources.updateCategory(entity);
    return result;
  }
}
