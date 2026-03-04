import 'package:equatable/equatable.dart';

import '../../../../core/base/base.src.dart';
import '../../../home/domain/domain.src.dart';

abstract class DetailProductEvent extends BaseEvent {
  const DetailProductEvent();

  @override
  List<Object> get props => [];
}

class DeleteProduct extends DetailProductEvent {
  final int? id;
  const DeleteProduct(this.id);
}

class FetchCategory extends DetailProductEvent {
  const FetchCategory();
}

class DetailStarted extends DetailProductEvent {
  const DetailStarted();
}

class DetailProductStarted extends DetailProductEvent {
  final ProductEntity? entity;
  const DetailProductStarted([this.entity]);
}

class DetailCreateStarted extends DetailProductEvent {
  const DetailCreateStarted();
}

class UpImage extends DetailProductEvent {
  const UpImage();
}

class UpDateProduct extends DetailProductEvent {
  const UpDateProduct();
}

class CreateProduct extends DetailProductEvent {
  const CreateProduct();
}

class CreateCategory extends DetailProductEvent {
  const CreateCategory();
}

class ProductUpdateOrCreate extends DetailProductEvent {
  const ProductUpdateOrCreate();
}

class UpdateSelectedCategory extends DetailProductEvent {
  final CategoriesEntity? category;

  const UpdateSelectedCategory(this.category);

  @override
  List<Object> get props => [category!];
}

class OnEditPressed extends DetailProductEvent {
  const OnEditPressed();
}

class OnBack extends DetailProductEvent {
  const OnBack();
}

class ResetCreateSuccess extends DetailProductEvent {}
