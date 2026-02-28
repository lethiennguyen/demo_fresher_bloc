// import 'package:demo_fresher_bloc/core/core.src.dart';
// import 'package:demo_fresher_bloc/feature/detail/mapper/category_data_mapper.dart';
// import 'package:demo_fresher_bloc/feature/detail/mapper/detail_product_mapper.dart';
// import 'package:get/get.dart';
//
// import '../../data/data.src.dart';
// import '../../domain/domain.src.dart';
// import '../../domain/use_case/use_case.src.dart';
// import '../controller/controller.src.dart';
//
// class DetailProductBinding extends BaseBinding {
//   @override
//   void dependencies() {
//     super.dependencies();
//     Get.lazyPut<DetailProductMapper>(
//         () => DetailProductMapper(Get.find(), Get.find()));
//     Get.lazyPut<ProductDataMapper>(() => ProductDataMapper());
//     Get.lazyPut<CategoryRequestMapper>(() => CategoryRequestMapper());
//   }
//
//   @override
//   void injectController() {
//     Get.lazyPut(() => DetailProductController(Get.find(), Get.arguments));
//   }
//
//   @override
//   void injectRepository() {
//     Get.lazyPut<DetailProductDataSources>(
//         () => DetailProductSourceImpl(Get.find()));
//     Get.lazyPut<DetailProductRepository>(
//         () => DetailProductRepoImpl(Get.find()));
//   }
//
//   @override
//   void injectUseCase() {
//     Get.lazyPut<DetailProductUseCase>(() => DetailProductUseCase(
//         Get.find(), Get.find(), Get.find(), Get.find(), Get.find()));
//     Get.lazyPut<CategoriesDetailUseCase>(
//         () => CategoriesDetailUseCase(Get.find()));
//     Get.lazyPut<CreateProductUseCase>(() => CreateProductUseCase(Get.find()));
//     Get.lazyPut<CreateCategoryUseCase>(() => CreateCategoryUseCase(Get.find()));
//     Get.lazyPut<UpdateProductUseCase>(() => UpdateProductUseCase(Get.find()));
//     Get.lazyPut<DeleteProductDetailUseCase>(
//         () => DeleteProductDetailUseCase(Get.find()));
//   }
// }
