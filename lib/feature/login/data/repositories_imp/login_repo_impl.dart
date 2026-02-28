import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/login/data/data.src.dart';
import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';
import 'package:demo_fresher_bloc/feature/login/mapper/login_pesponse_mapper.dart';

class LoginRepoImpl extends LoginRepository {
  LoginResponseMapper mapper;
  LoginDataSources loginDataSources;

  LoginRepoImpl(this.mapper, this.loginDataSources);
  @override
  Future<ApiResponse<LoginDataEntity?>> login(LoginRequestEntity entity) async {
    final response = await loginDataSources.login(entity);
    return ApiResponse<LoginDataEntity>(
        data: mapper.mapToEntity(response.data),
        message: response.message,
        errorKey: response.errorKey,
        statusCode: response.statusCode);
  }
}
