import 'package:demo_fresher_bloc/feature/detail/domain/entities/category_request_entity.dart';
import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';
import 'package:demo_fresher_bloc/feature/home/domain/repositories/home_repository.dart';

import '../../../../core/base/base.src.dart';
import '../../domain/domain.src.dart';
import '../../mapper/mapper.src.dart';

class HomeRepoImpl extends HomeRepository {
  HomeMapper mapper;
  HomeDataSources homeDataSources;

  HomeRepoImpl(this.mapper, this.homeDataSources);

  @override
  Future<BaseResponseList<CategoriesEntity>> categories() async {
    final result = await homeDataSources.categories();
    return BaseResponseList(
      data: result.data
          ?.map((e) => mapper.categoriesDataMapper.mapToEntity(e))
          .toList(),
      errorKey: result.errorKey,
      statusCode: result.statusCode,
      message: result.message,
    );
  }

  @override
  Future<BaseResponseList<ProductEntity>> lisProductItem(
      ListProductRequestEntity entity) async {
    final result = await homeDataSources.lisProductItem(entity);
    return BaseResponseList(
      data:
          result.data?.map((e) => mapper.productMapper.mapToEntity(e)).toList(),
      errorKey: result.errorKey,
      statusCode: result.statusCode,
      message: result.message,
    );
  }

  @override
  Future<BaseResponse<bool>> deleteProduct(DeleteProductEntity entity) async {
    final result = await homeDataSources.deleteProject(entity);
    return result;
  }

  @override
  Future<BaseResponse<bool>> deleteCategory(DeleteCategoryEntity entity) async {
    final result = await homeDataSources.deleteCategory(entity);
    return result;
  }

  @override
  Future<BaseResponse> updateCategory(CategoryRequestEntity entity) async {
    final result = await homeDataSources.updateCategory(entity);
    return result;
  }
}
