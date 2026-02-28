import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';

import '../../../../core/base/base.src.dart';
import '../model/login_response_model.dart';

abstract class LoginDataSources {
  Future<ApiResponse<LoginResponseModel>> login(LoginRequestEntity entity);
}
