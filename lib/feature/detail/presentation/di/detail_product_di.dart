import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/feature/detail/mapper/category_data_mapper.dart';
import 'package:demo_fresher_bloc/feature/detail/mapper/detail_product_mapper.dart';
import 'package:get_it/get_it.dart';

import '../../../home/domain/domain.src.dart';
import '../../data/data.src.dart';
import '../../domain/domain.src.dart';
import '../../domain/use_case/use_case.src.dart';
import '../bloc/detail_product_bloc.dart';

class DetailProductDI implements DIModule {
  @override
  Future<void> register(GetIt sl) async {
    sl.registerFactory(
      () => DetailProductUseCase(sl(), sl(), sl(), sl(), sl()),
    );

    sl.registerFactory(() => CategoriesDetailUseCase(sl()));
    sl.registerFactory(() => CreateProductUseCase(sl()));
    // sl.registerFactory(() => CreateCategoryUseCase(sl()));
    sl.registerFactory(() => UpdateProductUseCase(sl()));
    sl.registerFactory(() => DeleteProductDetailUseCase(sl()));

    sl.registerFactoryParam<DetailProductBloc, ProductEntity?, void>(
      (entity, _) => DetailProductBloc(sl(), entity),
    );
  }
}
