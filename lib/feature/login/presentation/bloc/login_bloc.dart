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

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBloc(this.useCase) : super(LoginState.initial()) {
    on<LoginStarted>(_onStarted);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginMessageConsumed>((event, emit) {
      emit(state.copyWith(clearMessage: true));
    });
  }

  void _onStarted(LoginStarted event, Emitter<LoginState> emit) {
    userNameController.text = "cuongpc10";
    passWorkController.text = "123456";
  }

  Future<void> _onSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, success: false));
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    try {
      print("userName: ${userNameController.text}");
      print("password: ${passWorkController.text}");
      final entity = LoginRequestEntity(
        userName: userNameController.text.toString(),
        passWord: passWorkController.text.toString(),
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
      print("listener success=${state.success}, loading=${state.isLoading}");
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

  String? userName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Vui lòng nhập tên đăng nhập";
    }
    return null;
  }

  String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Vui lòng nhập mật khẩu";
    }
    return null;
  }
}
