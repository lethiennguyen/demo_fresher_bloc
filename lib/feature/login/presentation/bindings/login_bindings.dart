// import 'package:demo_fresher_bloc/core/core.src.dart';
// import 'package:demo_fresher_bloc/feature/login/data/data.src.dart';
// import 'package:demo_fresher_bloc/feature/login/domain/domain.src.dart';
// import 'package:demo_fresher_bloc/feature/login/domain/use_case/login_use_case.dart';
// import 'package:demo_fresher_bloc/feature/login/mapper/login_pesponse_mapper.dart';
// import 'package:demo_fresher_bloc/feature/login/mapper/login_request_mapper.dart';
// import 'package:get/get.dart';
//
// import '../presentation.src.dart';
//
// class LoginBinding extends BaseBinding {
//   @override
//   void dependencies() {
//     Get.lazyPut(() => LoginResponseMapper());
//     Get.lazyPut(() => LoginRequestMapper());
//     super.dependencies();
//   }
//
//   @override
//   void injectController() {
//     Get.lazyPut<LoginController>(() => LoginController(Get.find()));
//   }
//
//   @override
//   void injectRepository() {
//     Get.lazyPut<LoginDataSources>(() => LoginDataSourcesImpl(Get.find()));
//     Get.lazyPut<LoginRepository>(() => LoginRepoImpl(Get.find(), Get.find()));
//   }
//
//   @override
//   void injectUseCase() {
//     Get.lazyPut<LoginUseCase>(() => LoginUseCase(Get.find()));
//   }
// }
