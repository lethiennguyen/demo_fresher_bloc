import 'package:demo_fresher_bloc/feature/home/data/model/delete_category_request.dart';

import '../../../shared/mappers/base/base_data_mapper.dart';
import '../domain/domain.src.dart';

class DeleteCategoryMapper
    extends BaseDataMapper<DeleteCategoryRequestModel, DeleteCategoryEntity>
    with DataMapperMixin {
  @override
  DeleteCategoryRequestModel mapToData(DeleteCategoryEntity entity) {
    return DeleteCategoryRequestModel(id: entity.id);
  }

  @override
  DeleteCategoryEntity mapToEntity(DeleteCategoryRequestModel? data) {
    // TODO: implement mapToEntity
    throw UnimplementedError();
  }
}
