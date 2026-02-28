import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final bool isLoading;
  final bool isButtonLoading;
  final bool isOverlayLoading;
  final String? errorMessage;

  const BaseState({
    this.isLoading = false,
    this.isButtonLoading = false,
    this.isOverlayLoading = false,
    this.errorMessage,
  });

  BaseState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isOverlayLoading,
    bool? isButtonLoading,
  });

  @override
  List<Object?> get props =>
      [isLoading, isButtonLoading, isOverlayLoading, errorMessage];
}
