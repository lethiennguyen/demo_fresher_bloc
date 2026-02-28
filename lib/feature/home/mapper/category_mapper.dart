import 'package:demo_fresher_bloc/feature/home/data/model/list_product_response.dart';

import '../../../core/base/base.src.dart';
import '../data/model/category_response.dart';
import '../domain/entities/entity_category.dart';
import '../domain/entities/product_entity.dart';

class CategoryMapper extends BaseDataMapper<Category, CategoriesEntity>
    with DataMapperMixin {
  @override
  CategoriesEntity mapToEntity(Category? data) {
    return CategoriesEntity(
      id: data?.id,
      status: data?.status,
      createdAt: data?.createdAt,
      updatedAt: data?.updatedAt,
      name: data?.name,
    );
  }

  @override
  Category mapToData(CategoriesEntity entity) {
    return Category(
      id: entity.id,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      name: entity.name,
    );
  }
}

class ProductMapper
    extends BaseDataMapper<ProductItemResponseModel, ProductEntity>
    with DataMapperMixin {
  final _categoryMapper = CategoryMapper();

  @override
  ProductEntity mapToEntity(ProductItemResponseModel? data) {
    return ProductEntity(
      id: data?.id,
      status: data?.status,
      createdAt: data?.createdAt,
      updatedAt: data?.updatedAt,
      name: data?.name,
      code: data?.code,
      price: double.parse(data!.price.toString()),
      stock: data.stock,
      category: _categoryMapper.mapToEntity(data.category),
      description: data.description,
      image: data.image,
    );
  }

  @override
  ProductItemResponseModel mapToData(ProductEntity entity) {
    return ProductItemResponseModel(
      id: entity.id,
      status: entity.status,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      name: entity.name,
      code: entity.code,
      price: entity.price,
      stock: entity.stock,
      category: entity.category != null
          ? _categoryMapper.mapToData(entity.category!)
          : null,
      description: entity.description,
      image: entity.image,
    );
  }
}

class CategoriesDataMapper
    extends BaseDataMapper<CategoriesResponseModel, CategoriesEntity>
    with DataMapperMixin {
  @override
  CategoriesEntity mapToEntity(CategoriesResponseModel? data) {
    return CategoriesEntity(
      id: data?.id ?? 0,
      status: data?.status ?? 0,
      name: data?.name ?? '',
      createdAt: data?.createdAt,
      updatedAt: data?.updatedAt,
    );
  }

  @override
  CategoriesResponseModel mapToData(CategoriesEntity entity) {
    return CategoriesResponseModel(
      id: entity.id,
      status: entity.status,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
