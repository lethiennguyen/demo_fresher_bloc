class CategoriesResponseModel {
  CategoriesResponseModel({
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

  CategoriesResponseModel copyWith({
    int? id,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
  }) {
    return CategoriesResponseModel(
      id: id ?? this.id,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
    );
  }

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
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
