import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String username;
  final String password;
  final bool isLoading;

  final bool isTaxFocused;
  final bool isUserNameFocused;

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
    this.isTaxFocused = false,
    this.isUserNameFocused = false,
  });

  factory LoginState.initial() => LoginState(
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
    bool? isTaxFocused,
    bool? isUserNameFocused,
  }) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        isLoading: isLoading ?? this.isLoading,
        message: clearMessage ? null : (message ?? this.message),
        success: success ?? this.success,
        isTaxFocused: isTaxFocused ?? this.isTaxFocused,
        isUserNameFocused: isUserNameFocused ?? this.isUserNameFocused);
  }

  @override
  List<Object?> get props => [username, password, isLoading, message, success];
}
