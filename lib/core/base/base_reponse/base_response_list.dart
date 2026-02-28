class BaseResponseList<T> {
  BaseResponseList({
    required this.success,
    required this.message,
    required this.data,
  });
  final bool success;
  final String message;
  final List<T> data;

  factory BaseResponseList.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic x) func,
  }) {
    return BaseResponseList(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      data: json['data'] != null
          ? List<T>.from(json['data'].map((x) => func(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson(Function(dynamic x) fuc) => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data.map((fuc) => fuc)),
  };
}
