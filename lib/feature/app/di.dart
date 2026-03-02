import 'package:get_it/get_it.dart';

import '../../core/core.src.dart';
import 'bloc/app_bloc.dart';

class AppDI extends DIModule {
  @override
  Future<void> register(GetIt sl) async {
    sl.registerFactory<AppBloc>(() => AppBloc(/* deps nếu có */));
  }
}
