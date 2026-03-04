import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:flutter/cupertino.dart';

class AppState extends BaseState {
  const AppState({
    super.isLoading,
    super.isButtonLoading,
    super.isOverlayLoading,
    super.errorMessage,
    super.message,
  });

  @override
  AppState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isOverlayLoading,
    bool? isButtonLoading,
    String? message,
  }) {
    return AppState(
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isOverlayLoading: isOverlayLoading ?? this.isOverlayLoading,
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
      message: message ?? this.message,
    );
  }
}

class AppInitial extends AppState {} // Trạng thái khởi tạo (hiện Splash)

class Authenticated extends AppState {} // Đã có token

class Unauthenticated extends AppState {} // Chưa có token
