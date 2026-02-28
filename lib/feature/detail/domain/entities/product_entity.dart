class ProductRequestEntity {
  final int? id;
  final String? name;
  final String? code;
  final double? price;
  final int? stock;
  final int? categoryId;
  final String? description;
  final String? image;

  ProductRequestEntity({
    this.id,
    this.name,
    this.code,
    this.price,
    this.stock,
    this.categoryId,
    this.description,
    this.image,
  });
}
