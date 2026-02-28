import '../../../shared/mappers/base/base_data_mapper.dart';
import '../data/model/list_product_request.dart';
import '../domain/entities/list_product_request.dart';

class ListProductRequestMapper
    extends BaseDataMapper<ListProductRequestModel, ListProductRequestEntity>
    with DataMapperMixin {
  @override
  ListProductRequestEntity mapToEntity(ListProductRequestModel? data) {
    return ListProductRequestEntity(
      categoryId: data?.categoryId,
      keyword: data?.keyword,
      page: data?.page,
      pageSize: data?.pageSize,
    );
  }

  @override
  ListProductRequestModel mapToData(ListProductRequestEntity entity) {
    return ListProductRequestModel(
      categoryId: entity.categoryId,
      keyword: entity.keyword,
      page: entity.page,
      pageSize: entity.pageSize,
    );
  }
}
