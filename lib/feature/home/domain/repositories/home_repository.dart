import '../../../../core/base/base_reponse/base_response.dart';
import '../../../detail/domain/domain.src.dart';
import '../domain.src.dart';

abstract class HomeRepository {
  Future<ApiResponseList<ProductEntity>> lisProductItem(
      ListProductRequestEntity entity);

  Future<ApiResponseList<CategoriesEntity>> categories();
  Future<ApiResponse> updateCategory(CategoryRequestEntity entity);
  Future<ApiResponse<bool>> deleteCategory(DeleteCategoryEntity entity);
  Future<ApiResponse<bool>> deleteProduct(DeleteProductEntity entity);
}
