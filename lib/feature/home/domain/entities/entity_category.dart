class CategoriesEntity {
  CategoriesEntity({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  int? id;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
}
