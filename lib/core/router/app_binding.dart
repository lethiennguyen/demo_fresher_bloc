import 'package:demo_fresher_bloc/feature/app/di.dart';
import 'package:demo_fresher_bloc/feature/home/presentation/bindings/home_binding.dart';
import 'package:get_it/get_it.dart';

import '../../feature/login/presentation/di/dependency_injection.dart';

final sl = GetIt.instance;

abstract class DIModule {
  Future<void> register(GetIt sl);
}

Future<void> setupDI(List<DIModule> modules) async {
  Future.wait(modules.map((module) => module.register(sl)).toList());
}

Future<void> moduleDIApp() async {
  await setupDI([AppDI(), LoginDI(), HomeDI()]);
}
