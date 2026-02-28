import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool isLoading;

  /// message để UI show dialog/snackbar (one-shot)
  final String? message;

  /// signal điều hướng
  final bool success;

  const LoginState({
    required this.username,
    required this.password,
    required this.isLoading,
    required this.message,
    required this.success,
  });

  factory LoginState.initial() => const LoginState(
        username: 'cuongpc10',
        password: '123456',
        isLoading: false,
        message: null,
        success: false,
      );

  LoginState copyWith({
    String? username,
    String? password,
    bool? isLoading,
    String? message,
    bool? success,
    bool clearMessage = false,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      message: clearMessage ? null : (message ?? this.message),
      success: success ?? this.success,
    );
  }

  @override
  List<Object?> get props => [username, password, isLoading, message, success];
}
