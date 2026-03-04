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
    sl.registerFactory(() => ListProductRequestMapper());
    sl.registerFactory(() => CategoryMapper());
    sl.registerFactory(() => ProductMapper());
    sl.registerFactory(() => CategoriesDataMapper());
    sl.registerFactory(() => DeleteProductsMapper());
    sl.registerFactory(() => DeleteCategoryMapper());
    sl.registerFactory(() => ProductDataMapper());
    sl.registerFactory(() => CategoryRequestMapper());

    // Detail mapper
    sl.registerFactory(() => DetailProductMapper(sl(), sl()));

    // HomeMapper phụ thuộc nhiều mapper con
    sl.registerFactory(
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
    sl.registerFactory<HomeDataSources>(() => HomeDataSourcesImpl(sl()));

    sl.registerFactory<DetailProductDataSources>(
      () => DetailProductSourceImpl(sl()),
    );

    // =========================
    // 3) REPOSITORIES
    // =========================
    sl.registerFactory<HomeRepository>(() => HomeRepoImpl(sl(), sl()));
    sl.registerFactory<DetailProductRepository>(
      () => DetailProductRepoImpl(sl()),
    );

    // =========================
    // 4) USE CASES
    // =========================
    // Nếu HomeUseCase constructor đúng như bạn đang truyền 7 deps
    sl.registerFactory(
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

    sl.registerFactory(() => ListProductItemUseCase(sl()));
    sl.registerFactory(() => CategoriesUseCase(sl()));
    sl.registerFactory(() => DeleteProductUseCase(sl()));
    sl.registerFactory(() => DeleteCategoryUseCase(sl()));
    sl.registerFactory(() => CreateCategoryUseCase(sl()));
    sl.registerFactory(() => UpdateCategoryUseCase(sl()));

    // Không có dep => factory/singleton đều được
    sl.registerFactory(() => LogoutUseCase());

    sl.registerFactory<HomeBloc>(() => HomeBloc(sl()));
  }
}
