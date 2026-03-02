import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/feature/login/presentation/bloc/controller.src.dart';
import 'package:get_it/get_it.dart';

import '../../data/data.src.dart';
import '../../domain/domain.src.dart';
import '../../domain/use_case/login_use_case.dart';
import '../../mapper/login_pesponse_mapper.dart';
import '../../mapper/login_request_mapper.dart';

class LoginDI extends DIModule {
  @override
  Future<void> register(GetIt sl) async {
    // Mappers
    sl.registerFactory<LoginResponseMapper>(() => LoginResponseMapper());
    sl.registerFactory<LoginRequestMapper>(() => LoginRequestMapper());

    sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));

    sl.registerFactory<LoginDataSources>(
      () => LoginDataSourcesImpl(sl()),
    );

    // Repository
    sl.registerFactory<LoginRepository>(
      () => LoginRepoImpl(sl(), sl()),
    );

    sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
  }
}
