import '../../../../core/base/base.src.dart';
import '../../domain/domain.src.dart';

import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeStarted extends HomeEvent {
  const HomeStarted();
}

class HomeRefreshRequested extends HomeEvent {
  const HomeRefreshRequested();
}

class HomeLoadMoreRequested extends HomeEvent {
  const HomeLoadMoreRequested();
}

class HomeFetchCategoriesRequested extends HomeEvent {
  const HomeFetchCategoriesRequested();
}

class HomeCategorySelected extends HomeEvent {
  final CategoriesEntity? category;
  const HomeCategorySelected(this.category);

  @override
  List<Object?> get props => [category];
}

class HomeCreateCategoryRequested extends HomeEvent {
  final String name;
  const HomeCreateCategoryRequested(this.name);

  @override
  List<Object?> get props => [name];
}

class HomeUpdateCategoryRequested extends HomeEvent {
  final int? id;
  final String name;
  const HomeUpdateCategoryRequested({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class HomeDeleteCategoryRequested extends HomeEvent {
  final int? id;
  const HomeDeleteCategoryRequested(this.id);

  @override
  List<Object?> get props => [id];
}

class HomeDeleteProductRequested extends HomeEvent {
  final int? id;
  const HomeDeleteProductRequested(this.id);

  @override
  List<Object?> get props => [id];
}

class HomeToggleEditCategory extends HomeEvent {
  const HomeToggleEditCategory();
}

class HomeSearchChanged extends HomeEvent {
  final String keyword;
  const HomeSearchChanged(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class HomeFilterByCategoryRequested extends HomeEvent {
  final int? categoryId;
  const HomeFilterByCategoryRequested(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}

class HomeLogoutRequested extends HomeEvent {
  const HomeLogoutRequested();
}

class OpenFilter extends HomeEvent {
  final bool showFilter;
  final bool isFilterCategory;
  const OpenFilter({this.showFilter = true, this.isFilterCategory = false});
}

class FilterStatus extends HomeEvent {
  const FilterStatus();
}

class HomeMessageConsumed extends HomeEvent {
  const HomeMessageConsumed();
}
