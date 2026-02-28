class DeleteCategoryRequestModel {
  DeleteCategoryRequestModel({
    required this.id,
  });

  final int? id;

  factory DeleteCategoryRequestModel.fromJson(Map<String, dynamic> json) {
    return DeleteCategoryRequestModel(
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}
