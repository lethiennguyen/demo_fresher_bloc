import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final bool isLoading;
  final bool isButtonLoading;
  final bool isOverlayLoading;
  final String? errorMessage;
  final String? message;
  final int? messageId;

  const BaseState({
    this.isLoading = false,
    this.isButtonLoading = false,
    this.isOverlayLoading = false,
    this.errorMessage,
    this.message,
    this.messageId,
  });

  BaseState copyWith({
    String? errorMessage,
    bool? isLoading,
    bool? isOverlayLoading,
    bool? isButtonLoading,
    String? message,
  });

  @override
  List<Object?> get props =>
      [isLoading, isButtonLoading, isOverlayLoading, errorMessage, message];
}
