class DeleteProduct {
  DeleteProduct({
    required this.id,
  });

  final int? id;

  DeleteProduct copyWith({
    int? id,
  }) {
    return DeleteProduct(
      id: id ?? this.id,
    );
  }

  factory DeleteProduct.fromJson(Map<String, dynamic> json) {
    return DeleteProduct(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
