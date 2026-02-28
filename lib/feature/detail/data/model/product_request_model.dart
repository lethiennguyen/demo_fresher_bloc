class ProductResponse {
  ProductResponse({
    required this.id,
    required this.name,
    required this.code,
    required this.price,
    required this.stock,
    required this.categoryId,
    required this.description,
    required this.image,
  });

  final int? id;
  final String? name;
  final String? code;
  final dynamic price;
  final int? stock;
  final int? categoryId;
  final String? description;
  final String? image;

  ProductResponse copyWith({
    String? name,
    String? code,
    double? price,
    int? stock,
    int? categoryId,
    String? description,
    String? image,
  }) {
    return ProductResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      categoryId: categoryId ?? this.categoryId,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      id: json["id"],
      name: json["name"],
      code: json["code"],
      price: json["price"],
      stock: json["stock"],
      categoryId: json["category_id"],
      description: json["description"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "price": price,
        "stock": stock,
        "category_id": categoryId,
        "description": description,
        "image": image,
      };
}
