class ServerError {
  final String? code;
  final String? errorMessage;

  const ServerError({
    this.code,
    this.errorMessage,
  });

  factory ServerError.fromJson(Map<String, dynamic> json) {
    return ServerError(
      code: json['message'] as String?,
      errorMessage: json['error_key'] as String?,
    );
  }

  @override
  String toString() {
    return 'ServerError{message: $code, error_key: $errorMessage}';
  }
}
