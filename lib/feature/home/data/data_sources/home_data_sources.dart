import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';

import '../../../../core/base/base.src.dart';
import '../../../detail/domain/domain.src.dart';
import '../../domain/domain.src.dart';

abstract class HomeDataSources {
  Future<BaseResponseList<ProductItemResponseModel>> lisProductItem(
      ListProductRequestEntity entity);

  Future<BaseResponseList<CategoriesResponseModel>> categories();

  Future<BaseResponse> updateCategory(CategoryRequestEntity entity);

  Future<BaseResponse<bool>> deleteCategory(DeleteCategoryEntity entity);

  Future<BaseResponse<bool>> deleteProject(DeleteProductEntity entity);
}
