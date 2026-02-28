import '../domain.src.dart';

class CategoryEntity {
  final int? id;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  const CategoryEntity({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  CategoryEntity copyWith({
    int? id,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
    );
  }
}

class ProductEntity {
  final int? id;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? code;
  final double? price;
  final int? stock;
  final CategoriesEntity? category;
  final String? description;
  final String? image;

  const ProductEntity({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.code,
    this.price,
    this.stock,
    this.category,
    this.description,
    this.image,
  });

  ProductEntity copyWith({
    int? id,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? code,
    double? price,
    int? stock,
    CategoriesEntity? category,
    String? description,
    String? image,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      category: category ?? this.category,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }
}
