import '../../../core/base/base_mapper/base_mapper.dart';
import '../data/data.src.dart';
import '../domain/domain.src.dart';

class CategoryRequestMapper
    extends BaseDataMapper<CategoryRequestModel, CategoryRequestEntity>
    with DataMapperMixin {
  @override
  CategoryRequestEntity mapToEntity(CategoryRequestModel? data) {
    return CategoryRequestEntity(
      id: data?.id,
      name: data?.name,
    );
  }

  @override
  CategoryRequestModel mapToData(CategoryRequestEntity entity) {
    return CategoryRequestModel(
      name: entity.name,
    );
  }
}
