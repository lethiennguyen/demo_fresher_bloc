import 'package:demo_fresher_bloc/core/base/base.src.dart';

import '../../domain/domain.src.dart';

abstract class DetailProductDataSources {
  Future<BaseResponse<bool>> updateProduct(ProductRequestEntity entity);

  Future<BaseResponse> createProduct(ProductRequestEntity entity);

  Future<BaseResponse<bool>> deleteProduct(ProductRequestEntity entity);

  Future<BaseResponse> createCategory(CategoryRequestEntity entity);
}
