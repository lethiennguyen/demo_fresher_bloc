import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';

import '../../../../core/base/base.src.dart';
import '../../../detail/domain/domain.src.dart';
import '../../domain/domain.src.dart';

abstract class HomeDataSources {
  Future<ApiResponseList<ProductItemResponseModel>> lisProductItem(
      ListProductRequestEntity entity);

  Future<ApiResponseList<CategoriesResponseModel>> categories();

  Future<ApiResponse> updateCategory(CategoryRequestEntity entity);

  Future<ApiResponse<bool>> deleteCategory(DeleteCategoryEntity entity);

  Future<ApiResponse<bool>> deleteProject(DeleteProductEntity entity);
}
