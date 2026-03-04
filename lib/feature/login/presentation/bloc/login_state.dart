import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;

  final bool isTaxFocused;
  final bool isUserNameFocused;

  /// message để UI show dialog/snackbar (one-shot)
  final String? message;

  /// signal điều hướng
  final bool success;

  const LoginState({
    required this.isLoading,
    required this.message,
    required this.success,
    this.isTaxFocused = false,
    this.isUserNameFocused = false,
  });

  factory LoginState.initial() => LoginState(
        isLoading: false,
        message: null,
        success: false,
      );

  LoginState copyWith({
    bool? isLoading,
    String? message,
    bool? success,
    bool clearMessage = false,
    bool? isTaxFocused,
    bool? isUserNameFocused,
  }) {
    return LoginState(
        isLoading: isLoading ?? this.isLoading,
        message: clearMessage ? null : (message ?? this.message),
        success: success ?? this.success,
        isTaxFocused: isTaxFocused ?? this.isTaxFocused,
        isUserNameFocused: isUserNameFocused ?? this.isUserNameFocused);
  }

  @override
  List<Object?> get props =>
      [isLoading, message, success, isTaxFocused, isUserNameFocused];
}
