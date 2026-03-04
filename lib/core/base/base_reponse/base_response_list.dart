class BaseResponseList<T> {
  final List<T>? data;
  final String? message;
  final String? errorKey;
  final int? statusCode;

  bool get isSuccess => errorKey == null;

  BaseResponseList({
    this.data,
    this.message,
    this.errorKey,
    this.statusCode,
  });

  factory BaseResponseList.fromJson(
    Map<String, dynamic> json, {
    required T Function(dynamic x) func,
  }) {
    return BaseResponseList(
      data: json['data'] != null
          ? List<T>.from(
              (json['data'] as List).map((x) => func(x)),
            )
          : [],
      message: json['message'],
      errorKey: json['error_key'],
      statusCode: json['status_code'],
    );
  }
}
