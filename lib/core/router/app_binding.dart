import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/app/bloc/app_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../lib.dart';

final sl = GetIt.instance;
Future<void> setupDI() async {
  // repo/usecase... nếu có

  sl.registerFactory<AppBloc>(() => AppBloc(/* deps nếu có */));
}
