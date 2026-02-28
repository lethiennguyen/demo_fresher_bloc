import 'package:demo_fresher_bloc/core/base/base_reponse/base_response.dart';
import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';
import '../../domain/domain.src.dart';
import '../../mapper/mapper.src.dart';
import '../data.src.dart';

class DetailProductRepoImpl extends DetailProductRepository {
  DetailProductDataSources detailProductDataSources;

  DetailProductRepoImpl(this.detailProductDataSources);

  @override
  Future<ApiResponse> create(ProductRequestEntity entity) async {
    return await detailProductDataSources.createProduct(entity);
  }

  @override
  Future<ApiResponse<bool>> updateProject(ProductRequestEntity entity) async {
    return await detailProductDataSources.updateProduct(entity);
  }

  @override
  Future<ApiResponse> createCategory(CategoryRequestEntity entity) {
    return detailProductDataSources.createCategory(entity);
  }

  @override
  Future<ApiResponse<bool>> deleteProduct(ProductRequestEntity entity) async {
    return await detailProductDataSources.deleteProduct(entity);
  }
}
