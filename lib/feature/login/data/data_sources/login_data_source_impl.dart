import 'package:demo_fresher_bloc/core/base/base.src.dart';
import 'package:demo_fresher_bloc/feature/login/data/data_sources/data_sources.src.dart';
import 'package:demo_fresher_bloc/feature/login/data/model/login_response_model.dart';
import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';
import 'package:demo_fresher_bloc/feature/login/mapper/login_request_mapper.dart';

import '../../../../lib.dart';

class LoginDataSourcesImpl extends BaseRepositoryBL
    implements LoginDataSources {
  LoginRequestMapper mapper;

  LoginDataSourcesImpl(this.mapper);

  @override
  Future<ApiResponse<LoginResponseModel>> login(
      LoginRequestEntity entity) async {
    final res = await baseCallApi(
      ApiUrl.login,
      EnumRequestMethod.POST,
      jsonMap: mapper.mapToData(entity).toJson(),
      isQueryParametersPost: false,
      isToken: false,
    );
    return ApiResponse<LoginResponseModel>.fromJson(
      res.data,
      func: (res) => LoginResponseModel.fromJson(res),
    );
  }
}
