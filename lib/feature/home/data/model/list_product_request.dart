import 'dart:convert';

class ListProductRequestModel {
  final int? categoryId;
  final String? keyword;
  final int? page;
  final int? pageSize;
  ListProductRequestModel(
      {this.categoryId, this.keyword, this.page, this.pageSize});

  ListProductRequestModel copyWith({
    int? categoryId,
    String? keyword,
    int? page,
    int? pageSize,
  }) {
    return ListProductRequestModel(
      categoryId: categoryId ?? this.categoryId,
      keyword: keyword ?? this.keyword,
      page: page ?? this.page,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  factory ListProductRequestModel.fromJson(Map<String, dynamic> json) {
    return ListProductRequestModel(
      categoryId: json["category_id"],
      keyword: json["keyword"],
      page: json["page"],
      pageSize: json["limit"],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "category_id": categoryId,
      "keyword": keyword,
      "page": page,
      "limit": pageSize,
    };

    data.removeWhere(
      (key, value) =>
          value == null || (value is String && value.trim().isEmpty),
    );

    return data;
  }
}
