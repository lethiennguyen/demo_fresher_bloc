// class BaseResponse<T> {
//   BaseResponse({
//     required this.success,
//     required this.message,
//     required this.data,
//   });
//   final bool success;
//   final String message;
//   final T? data;
//
//   factory BaseResponse.fromJson(
//     Map<String, dynamic> json, {
//     T Function(Map<String, dynamic> x)? func,
//   }) {
//     T? convertObject() => func != null ? func(json['data']) : json['data'];
//     return BaseResponse(
//       success: json['success'] ?? false,
//       message: json['message'] ?? "",
//       data: json['data'] != null ? convertObject() : null,
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data,
//       };
// }

class BaseResponse<T> {
  final T? data;
  final String? message;
  final String? errorKey;
  final int? statusCode;

  bool get isSuccess => errorKey == null;

  BaseResponse({
    this.data,
    this.message,
    this.errorKey,
    this.statusCode,
  });

  factory BaseResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic data)? func,
  }) {
    return BaseResponse(
      data: func != null && json['data'] != null
          ? func(json['data'])
          : json['data'],
      message: json['message'],
      errorKey: json['error_key'],
      statusCode: json['status_code'],
    );
  }
}
