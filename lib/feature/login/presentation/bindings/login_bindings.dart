import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/feature/login/data/data.src.dart';
import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';
import 'package:demo_fresher_bloc/feature/login/domain/use_case/login_use_case.dart';
import 'package:demo_fresher_bloc/feature/login/mapper/login_pesponse_mapper.dart';
import 'package:demo_fresher_bloc/feature/login/mapper/login_request_mapper.dart';
import 'package:get_it/get_it.dart';

import '../presentation.src.dart';

class LoginDI implements DIModule {
  @override
  Future<void> register(GetIt sl) async {
    // Mappers (stateless -> singleton ok)
    sl.registerLazySingleton(() => LoginResponseMapper());
    sl.registerLazySingleton(() => LoginRequestMapper());

    // DataSource
    sl.registerLazySingleton<LoginDataSources>(
      () => LoginDataSourcesImpl(sl()),
    );

    // Repository
    sl.registerLazySingleton<LoginRepository>(
      () => LoginRepoImpl(sl(), sl()),
    );

    // UseCase
    sl.registerLazySingleton(() => LoginUseCase(sl()));

    // Controller (per screen)
    sl.registerFactory(() => LoginBloc(sl()));
  }
}
