import '../../../../core/base/base_reponse/base_response.dart';
import '../domain.src.dart';

abstract class DetailProductRepository {
  Future<ApiResponse> create(ProductRequestEntity entity);

  Future<ApiResponse<bool>> updateProject(ProductRequestEntity entity);
  Future<ApiResponse<bool>> deleteProduct(ProductRequestEntity entity);

  Future<ApiResponse> createCategory(CategoryRequestEntity entity);
}
