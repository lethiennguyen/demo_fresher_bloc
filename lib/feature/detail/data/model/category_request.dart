class CategoryRequestModel {
  CategoryRequestModel({
    this.id,
    required this.name,
  });
  final int? id;
  final String? name;

  CategoryRequestModel copyWith({
    int? id,
    String? name,
  }) {
    return CategoryRequestModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory CategoryRequestModel.fromJson(Map<String, dynamic> json) {
    return CategoryRequestModel(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
