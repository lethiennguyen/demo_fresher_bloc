import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/feature/detail/data/data.src.dart';
import 'package:demo_fresher_bloc/feature/detail/domain/domain.src.dart';
import 'package:demo_fresher_bloc/feature/detail/domain/use_case/detail_product_use_case.dart';
import 'package:demo_fresher_bloc/feature/home/data/data.src.dart';
import 'package:demo_fresher_bloc/feature/home/domain/repositories/home_repository.dart';
import 'package:demo_fresher_bloc/feature/home/presentation/bloc/controller.src.dart';
import 'package:get_it/get_it.dart';

import '../../../detail/mapper/mapper.src.dart';
import '../../domain/domain.src.dart';
import '../../mapper/mapper.src.dart';

class HomeDI implements DIModule {
  @override
  Future<void> register(GetIt sl) async {
    // =========================
    // 1) MAPPERS
    // =========================
    sl.registerLazySingleton(() => ListProductRequestMapper());
    sl.registerLazySingleton(() => CategoryMapper());
    sl.registerLazySingleton(() => ProductMapper());
    sl.registerLazySingleton(() => CategoriesDataMapper());
    sl.registerLazySingleton(() => DeleteProductsMapper());
    sl.registerLazySingleton(() => DeleteCategoryMapper());
    sl.registerLazySingleton(() => ProductDataMapper());
    sl.registerLazySingleton(() => CategoryRequestMapper());

    // Detail mapper
    sl.registerLazySingleton(() => DetailProductMapper(sl(), sl()));

    // HomeMapper phụ thuộc nhiều mapper con
    sl.registerLazySingleton(
      () => HomeMapper(
        sl(),
        // ListProductRequestMapper
        sl(),
        // CategoryMapper
        sl(),
        // ProductMapper
        sl(),
        // CategoriesDataMapper
        sl(),
        // DeleteProductsMapper
        sl(),
        // DeleteCategoryMapper
        sl(), // ProductDataMapper (hoặc mapper thứ 7 bạn truyền)
      ),
    );

    // =========================
    // 2) DATA SOURCES
    // =========================
    sl.registerLazySingleton<HomeDataSources>(() => HomeDataSourcesImpl(sl()));

    sl.registerLazySingleton<DetailProductDataSources>(
      () => DetailProductSourceImpl(sl()),
    );

    // =========================
    // 3) REPOSITORIES
    // =========================
    sl.registerLazySingleton<HomeRepository>(() => HomeRepoImpl(sl(), sl()));
    sl.registerLazySingleton<DetailProductRepository>(
      () => DetailProductRepoImpl(sl()),
    );

    // =========================
    // 4) USE CASES
    // =========================
    // Nếu HomeUseCase constructor đúng như bạn đang truyền 7 deps
    sl.registerLazySingleton(
      () => HomeUseCase(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ),
    );

    sl.registerLazySingleton(() => ListProductItemUseCase(sl()));
    sl.registerLazySingleton(() => CategoriesUseCase(sl()));
    sl.registerLazySingleton(() => DeleteProductUseCase(sl()));
    sl.registerLazySingleton(() => DeleteCategoryUseCase(sl()));
    sl.registerLazySingleton(() => CreateCategoryUseCase(sl()));
    sl.registerLazySingleton(() => UpdateCategoryUseCase(sl()));

    // Không có dep => factory/singleton đều được
    sl.registerLazySingleton(() => LogoutUseCase());

    sl.registerLazySingleton(() => HomeBloc(sl()));
  }
}
