import 'package:demo_fresher_bloc/feature/app/di.dart';
import 'package:demo_fresher_bloc/feature/detail/presentation/di/binding.src.dart';
import 'package:demo_fresher_bloc/feature/home/presentation/di/binding.src.dart';
import 'package:get_it/get_it.dart';

import '../../feature/login/presentation/di/dependency_injection.dart';
import '../base/base_repository_clean/navigation_service.dart';

final sl = GetIt.instance;

abstract class DIModule {
  Future<void> register(GetIt sl);
}

Future<void> setupDI(List<DIModule> modules) async {
  await Future.wait(modules.map((module) => module.register(sl)).toList());
}

/// chủ yếu chỉ đăng ký map type → factory function trong GetIt.
///
/// Không tạo instance ngay (với registerLazySingleton)
///
/// registerFactory cũng không tạo cho tới khi bạn gọi sl<T>()
Future<void> moduleDIApp() async {
  /// batws looix hết token
  if (!sl.isRegistered<NavigationService>()) {
    sl.registerLazySingleton<NavigationService>(() => NavigationService());
  }

  await setupDI([AppDI(), LoginDI(), HomeDI(), DetailProductDI()]);
}
