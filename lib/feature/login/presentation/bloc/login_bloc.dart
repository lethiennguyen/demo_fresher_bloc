import 'package:bloc/bloc.dart';
import 'package:demo_fresher_bloc/feature/login/presentation/bloc/login_event.dart';
import 'package:demo_fresher_bloc/feature/login/presentation/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

import '../../../../core/core.src.dart';
import '../../domain/domain.src.dart';
import '../../domain/use_case/login_use_case.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase useCase;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWorkController = TextEditingController();

  final FocusNode userNameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  LoginBloc(this.useCase) : super(LoginState.initial()) {
    on<LoginStarted>(_onStarted);
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginMessageConsumed>((event, emit) {
      emit(state.copyWith(clearMessage: true));
    });
  }

  void _onStarted(LoginStarted event, Emitter<LoginState> emit) {
    // state.initial() đã set default username/pass rồi
  }

  void _onUsernameChanged(
      LoginUsernameChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, success: false));

    try {
      final entity = LoginRequestEntity(
        userName: state.username.trim(),
        passWord: state.password.trim(),
      );

      final response = await useCase.execute(entity);

      if (response.statusCode == 400) {
        emit(state.copyWith(
          isLoading: false,
          message: response.message ?? "Đăng nhập thất bại",
          success: false,
        ));
        return;
      }

      final box = Hive.box(HiveBoxNames.auth);
      box.put(HiveKeys.token, response.data?.accessToken);
      emit(state.copyWith(success: true));
    } catch (_) {
      emit(state.copyWith(
        isLoading: false,
        message: "Đăng nhập thất bại",
        success: false,
      ));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
