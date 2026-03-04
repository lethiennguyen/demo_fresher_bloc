import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';

abstract class LoginRepository {
  Future<BaseResponse<LoginDataEntity?>> login(LoginRequestEntity entity);
}
