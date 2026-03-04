import '../../../../core/base/base.src.dart';
import '../../../detail/domain/domain.src.dart';
import '../domain.src.dart';

abstract class HomeRepository {
  Future<BaseResponseList<ProductEntity>> lisProductItem(
      ListProductRequestEntity entity);

  Future<BaseResponseList<CategoriesEntity>> categories();

  Future<BaseResponse> updateCategory(CategoryRequestEntity entity);

  Future<BaseResponse<bool>> deleteCategory(DeleteCategoryEntity entity);

  Future<BaseResponse<bool>> deleteProduct(DeleteProductEntity entity);
}
