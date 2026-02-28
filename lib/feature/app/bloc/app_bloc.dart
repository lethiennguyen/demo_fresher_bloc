import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../core/core.src.dart';
import 'bloc.src.dart';

late Box HIVE_APP;

class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    // Đăng ký handler cho sự kiện AppStarted
    on<AppStarted>(_onAppStarted);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      final authBox = await Hive.openBox(HiveBoxNames.auth);

      final token = authBox.get(HiveKeys.token, defaultValue: '');

      await Future.delayed(const Duration(milliseconds: 2000));

      if (token != null && token.isNotEmpty) {
        emit(Authenticated());
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  Future<void> setLoggedIn(bool value) async {
    final authBox = Hive.box(HiveBoxNames.auth);
    await authBox.put('isLoggedIn', value);
  }
}
