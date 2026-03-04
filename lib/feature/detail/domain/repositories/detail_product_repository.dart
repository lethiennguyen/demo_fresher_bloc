import '../../../../core/base/base_reponse/base_response.dart';
import '../domain.src.dart';

abstract class DetailProductRepository {
  Future<BaseResponse> create(ProductRequestEntity entity);

  Future<BaseResponse<bool>> updateProject(ProductRequestEntity entity);
  Future<BaseResponse<bool>> deleteProduct(ProductRequestEntity entity);

  Future<BaseResponse> createCategory(CategoryRequestEntity entity);
}
