import 'package:equatable/equatable.dart';

import '../../../../core/base/base.src.dart';

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

class DetailProductStarted extends DetailProductEvent {
  const DetailProductStarted();
}
