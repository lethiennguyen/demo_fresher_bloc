import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.src.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  final List<CancelToken> cancelTokens = [];

  BaseBloc(S initialState) : super(initialState) {}

  // BaseBloc(S initialState) : super(initialState) {
  //   on<ShowLoading>((event, emit) {
  //     emit(state.copyWith(isLoading: true) as S);
  //   });
  //   on<HideLoading>((event, emit) {
  //     emit(state.copyWith(isLoading: false) as S);
  //   });
  //   on<ShowLoadingOverlay>((event, emit) {
  //     emit(state.copyWith(isOverlayLoading: true) as S);
  //   });
  //   on<HideLoadingOverlay>((event, emit) {
  //     emit(state.copyWith(isOverlayLoading: false) as S);
  //   });
  // }
  void addCancelToken(CancelToken token) {
    cancelTokens.add(token);
  }

  void cancelAllRequests() {
    for (final token in cancelTokens) {
      if (!token.isCancelled) {
        token.cancel("Cancelled when bloc closed");
      }
    }
  }

  @override
  Future<void> close() {
    cancelAllRequests();
    return super.close();
  }
}
