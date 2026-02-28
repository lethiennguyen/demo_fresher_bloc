import 'package:demo_fresher_bloc/feature/home/data/model/delete_product.dart';

import '../../../shared/mappers/base/base_data_mapper.dart';
import '../domain/domain.src.dart';

class DeleteProductsMapper
    extends BaseDataMapper<DeleteProduct, DeleteProductEntity>
    with DataMapperMixin {
  @override
  DeleteProduct mapToData(DeleteProductEntity entity) {
    return DeleteProduct(id: entity.id);
  }

  @override
  DeleteProductEntity mapToEntity(DeleteProduct? data) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }
}
