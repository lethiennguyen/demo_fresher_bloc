import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/home/domain/domain.src.dart';

import '../../../../lib.dart';
import '../../../detail/domain/domain.src.dart';
import '../../mapper/mapper.src.dart';
import '../data.src.dart';

class HomeDataSourcesImpl extends BaseRepositoryBL implements HomeDataSources {
  HomeMapper mapper;

  HomeDataSourcesImpl(this.mapper);

  @override
  Future<BaseResponseList<ProductItemResponseModel>> lisProductItem(
      ListProductRequestEntity entity) async {
    final res = await baseCallApi(
      ApiUrl.products,
      EnumRequestMethod.GET,
      jsonMap: mapper.listProductRequestMapper.mapToData(entity).toJson(),
      isQueryParametersPost: true,
      isToken: true,
    );
    return BaseResponseList<ProductItemResponseModel>.fromJson(
      res.data,
      func: (res) => ProductItemResponseModel.fromJson(res),
    );
  }

  @override
  Future<BaseResponseList<CategoriesResponseModel>> categories() async {
    final res = await baseCallApi(
      ApiUrl.categories,
      EnumRequestMethod.GET,
      isToken: true,
    );
    return BaseResponseList<CategoriesResponseModel>.fromJson(
      res.data,
      func: (res) => CategoriesResponseModel.fromJson(res),
    );
  }

  @override
  Future<BaseResponse<bool>> deleteProject(DeleteProductEntity entity) async {
    final res = await baseCallApi(
      "${ApiUrl.delete}/${entity.id}",
      EnumRequestMethod.DELETE,
      jsonMap: mapper.deleteProductsMapper.mapToData(entity).toJson(),
      isToken: true,
    );
    return BaseResponse<bool>.fromJson(res.data);
  }

  @override
  Future<BaseResponse<bool>> deleteCategory(DeleteCategoryEntity entity) async {
    final res = await baseCallApi(
      "${ApiUrl.categories}/${entity.id}",
      EnumRequestMethod.DELETE,
      isToken: true,
    );
    return BaseResponse<bool>.fromJson(res.data);
  }

  @override
  Future<BaseResponse> updateCategory(CategoryRequestEntity entity) async {
    final res = await baseCallApi(
      "${ApiUrl.categories}/${entity.id}",
      EnumRequestMethod.PUT,
      jsonMap: mapper.categoryRequestMapper.mapToData(entity).toJson(),
      isQueryParametersPost: false,
      isToken: true,
    );
    return BaseResponse.fromJson(
      res.data,
    );
  }
}
