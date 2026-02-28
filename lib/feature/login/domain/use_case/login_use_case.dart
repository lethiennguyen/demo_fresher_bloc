import 'dart:async';

import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';

class LoginUseCase
    extends UseCase<LoginRequestEntity, ApiResponse<LoginDataEntity?>> {
  final LoginRepository repository;
  LoginUseCase(this.repository);
  @override
  FutureOr<ApiResponse<LoginDataEntity?>> execute(
      LoginRequestEntity input) async {
    return await repository.login(input);
  }
}
