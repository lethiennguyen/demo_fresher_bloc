import '../../detail/mapper/mapper.src.dart';
import 'mapper.src.dart';

class HomeMapper {
  final ListProductRequestMapper listProductRequestMapper;
  final CategoryMapper categoryMapper;
  final ProductMapper productMapper;
  final CategoriesDataMapper categoriesDataMapper;
  final DeleteProductsMapper deleteProductsMapper;
  final DeleteCategoryMapper deleteCategoryMapper;
  final CategoryRequestMapper categoryRequestMapper;

  HomeMapper(
      this.listProductRequestMapper,
      this.categoryMapper,
      this.productMapper,
      this.categoriesDataMapper,
      this.deleteProductsMapper,
      this.deleteCategoryMapper,
      this.categoryRequestMapper);
}
