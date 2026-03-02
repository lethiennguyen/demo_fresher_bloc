import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/feature/detail/mapper/category_data_mapper.dart';
import 'package:demo_fresher_bloc/feature/detail/mapper/detail_product_mapper.dart';
import 'package:get_it/get_it.dart';

import '../../data/data.src.dart';
import '../../domain/domain.src.dart';
import '../../domain/use_case/use_case.src.dart';

class DetailProductDI implements DIModule {
  @override
  Future<void> register(GetIt sl) async {
    // =========================
    // 1) MAPPERS
    // =========================
    sl.registerLazySingleton(() => ProductDataMapper());
    sl.registerLazySingleton(() => CategoryRequestMapper());
    sl.registerLazySingleton(() => DetailProductMapper(sl(), sl()));

    // =========================
    // 2) DATA SOURCES
    // =========================
    sl.registerLazySingleton<DetailProductDataSources>(
      () => DetailProductSourceImpl(sl()),
    );

    // =========================
    // 3) REPOSITORIES
    // =========================
    sl.registerLazySingleton<DetailProductRepository>(
      () => DetailProductRepoImpl(sl()),
    );

    // =========================
    // 4) USE CASES
    // =========================
    sl.registerLazySingleton(
      () => DetailProductUseCase(sl(), sl(), sl(), sl(), sl()),
    );

    sl.registerLazySingleton(() => CategoriesDetailUseCase(sl()));
    sl.registerLazySingleton(() => CreateProductUseCase(sl()));
    sl.registerLazySingleton(() => CreateCategoryUseCase(sl()));
    sl.registerLazySingleton(() => UpdateProductUseCase(sl()));
    sl.registerLazySingleton(() => DeleteProductDetailUseCase(sl()));

    // =========================
    // 5) CONTROLLER (factory param)
    // =========================
    // Controller cần arguments => dùng registerFactoryParam
    // sl.registerFactoryParam<DetailProductController, dynamic, void>(
    //       (args, _) => DetailProductController(sl(), args),
    // );
  }
}
