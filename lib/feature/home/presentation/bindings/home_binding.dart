// import 'package:demo_fresher_bloc/core/core.src.dart';
// import 'package:demo_fresher_bloc/feature/detail/data/data.src.dart';
// import 'package:demo_fresher_bloc/feature/detail/domain/domain.src.dart';
// import 'package:demo_fresher_bloc/feature/detail/domain/use_case/detail_product_use_case.dart';
// import 'package:demo_fresher_bloc/feature/detail/mapper/detail_product_mapper.dart';
// import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';
// import 'package:demo_fresher_bloc/feature/home/data/repositories_imp/home_repo_impl.dart';
// import 'package:demo_fresher_bloc/feature/home/domain/repositories/home_repository.dart';
// import 'package:demo_fresher_bloc/feature/home/presentation/controller/controller.src.dart';
// import 'package:get/get.dart';
//
// import '../../../detail/mapper/mapper.src.dart';
// import '../../domain/domain.src.dart';
// import '../../mapper/mapper.src.dart';
//
// class HomeBinding extends BaseBinding {
//   @override
//   void dependencies() {
//     super.dependencies();
//     Get.lazyPut(() => HomeMapper(Get.find(), Get.find(), Get.find(), Get.find(),
//         Get.find(), Get.find(), Get.find()));
//     Get.lazyPut(() => ListProductRequestMapper());
//     Get.lazyPut(() => CategoryMapper());
//     Get.lazyPut(() => ProductMapper());
//     Get.lazyPut(() => CategoriesDataMapper());
//     Get.lazyPut(() => DeleteProductsMapper());
//     Get.lazyPut(() => DeleteCategoryMapper());
//     Get.lazyPut(() => DetailProductMapper(Get.find(), Get.find()));
//     Get.lazyPut(() => ProductDataMapper());
//     Get.lazyPut(() => CategoryRequestMapper());
//   }
//
//   @override
//   void injectController() {
//     Get.lazyPut(() => HomeController(Get.find()));
//   }
//
//   @override
//   void injectRepository() {
//     Get.lazyPut<HomeDataSources>(() => HomeDataSourcesImpl(Get.find()));
//     Get.lazyPut<HomeRepository>(() => HomeRepoImpl(Get.find(), Get.find()));
//     Get.lazyPut<DetailProductDataSources>(
//         () => DetailProductSourceImpl(Get.find()));
//     Get.lazyPut<DetailProductRepository>(
//         () => DetailProductRepoImpl(Get.find()));
//   }
//
//   @override
//   void injectUseCase() {
//     Get.lazyPut(() => HomeUseCase(Get.find(), Get.find(), Get.find(),
//         Get.find(), Get.find(), Get.find(), Get.find()));
//     Get.lazyPut(() => ListProductItemUseCase(Get.find()));
//     Get.lazyPut(() => CategoriesUseCase(Get.find()));
//     Get.lazyPut(() => DeleteProductUseCase(Get.find()));
//     Get.lazyPut(() => DeleteCategoryUseCase(Get.find()));
//     Get.lazyPut(() => CreateCategoryUseCase(Get.find()));
//     Get.lazyPut(() => UpdateCategoryUseCase(Get.find()));
//     Get.lazyPut(() => LogoutUseCase());
//   }
// }
