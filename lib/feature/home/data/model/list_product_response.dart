class ProductItemResponseModel {
  ProductItemResponseModel({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.code,
    required this.price,
    required this.stock,
    required this.category,
    required this.description,
    required this.image,
  });

  final int? id;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? code;
  final dynamic price;
  final int? stock;
  final Category? category;
  final String? description;
  final String? image;

  ProductItemResponseModel copyWith({
    int? id,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    String? code,
    double? price,
    int? stock,
    Category? category,
    String? description,
    String? image,
  }) {
    return ProductItemResponseModel(
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

  factory ProductItemResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductItemResponseModel(
      id: json["id"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      name: json["name"],
      code: json["code"],
      price: json["price"],
      stock: json["stock"],
      category:
          json["category"] == null ? null : Category.fromJson(json["category"]),
      description: json["description"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "code": code,
        "price": price,
        "stock": stock,
        "category": category?.toJson(),
        "description": description,
        "image": image,
      };
}

class Category {
  Category({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  final int? id;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  Category copyWith({
    int? id,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
  }) {
    return Category(
      id: id ?? this.id,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
      };
}
