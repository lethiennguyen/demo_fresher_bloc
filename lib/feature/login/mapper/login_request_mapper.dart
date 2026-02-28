import '../../../core/base/base.src.dart';
import '../data/model/login_request_model.dart';
import '../domain/entities/login_request_entity.dart';

class LoginRequestMapper
    extends BaseDataMapper<LoginRequestModel, LoginRequestEntity>
    with DataMapperMixin {
  @override
  LoginRequestEntity mapToEntity(LoginRequestModel? data) {
    return LoginRequestEntity(
      userName: data?.username,
      passWord: data?.password,
    );
  }

  @override
  LoginRequestModel mapToData(LoginRequestEntity entity) {
    return LoginRequestModel(
      username: entity.userName,
      password: entity.passWord,
    );
  }
}
