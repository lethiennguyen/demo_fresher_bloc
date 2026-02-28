import '../../../core/base/base.src.dart';
import '../data/model/login_response_model.dart';
import '../domain/domain.src.dart';

class LoginResponseMapper
    extends BaseDataMapper<LoginResponseModel, LoginDataEntity>
    with DataMapperMixin {
  @override
  LoginDataEntity mapToEntity(LoginResponseModel? data) {
    return LoginDataEntity(
      accessToken: data?.accessToken,
    );
  }

  @override
  LoginResponseModel mapToData(LoginDataEntity entity) {
    return LoginResponseModel(accessToken: entity.accessToken);
  }
}
