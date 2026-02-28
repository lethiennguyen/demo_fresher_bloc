import 'package:demo_fresher_bloc/core/base/base.src.dart';

import '../../domain/domain.src.dart';

abstract class DetailProductDataSources {
  Future<ApiResponse<bool>> updateProduct(ProductRequestEntity entity);

  Future<ApiResponse> createProduct(ProductRequestEntity entity);

  Future<ApiResponse<bool>> deleteProduct(ProductRequestEntity entity);

  Future<ApiResponse> createCategory(CategoryRequestEntity entity);
}
