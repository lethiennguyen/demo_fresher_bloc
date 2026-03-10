import 'package:equatable/equatable.dart';

import '../../domain/entities/entity.src.dart';

class HomeState extends Equatable {
  final List<ProductEntity> products;
  final List<CategoriesEntity> categories;
  final CategoriesEntity? selectedCategory;

  final int pageIndex;
  final int pageSize;
  final int total;
  final bool enablePullup;
  final bool showFilter; // thay cho controller.showFilter (UI state)
  final bool isFilterCategory; // thay cho controller.showFilter (UI state)

  final bool isLoading; // tương đương showLoading()
  final bool isButtonLoading; // tương đương showButtonLoading()
  final bool isBack;

  final bool isEditCategory;
  final String errorCategory;

  final String keyword;

  /// message để UI show snackbar/dialog (one-shot)
  final String? message;

  /// logout signal
  final bool didLogout;

  const HomeState({
    required this.products,
    required this.categories,
    required this.selectedCategory,
    required this.pageIndex,
    required this.pageSize,
    required this.total,
    required this.enablePullup,
    this.showFilter = false,
    this.isFilterCategory = false,
    required this.isBack,
    required this.isLoading,
    required this.isButtonLoading,
    required this.isEditCategory,
    required this.errorCategory,
    required this.keyword,
    required this.message,
    required this.didLogout,
  });

  factory HomeState.initial() => HomeState(
        products: [],
        categories: [],
        selectedCategory: null,
        pageIndex: 1,
        pageSize: 10,
        total: 0,
        enablePullup: true,
        showFilter: false,
        isLoading: false,
        isButtonLoading: false,
        isEditCategory: false,
        isFilterCategory: false,
        isBack: false,
        errorCategory: '',
        keyword: '',
        message: null,
        didLogout: false,
      );

  HomeState copyWith({
    List<ProductEntity>? products,
    List<CategoriesEntity>? categories,
    CategoriesEntity? selectedCategory,
    int? pageIndex,
    int? pageSize,
    int? total,
    bool? enablePullup,
    bool? isLoading,
    bool? showFilter,
    bool? isButtonLoading,
    bool? isEditCategory,
    bool? isBack,
    bool? isFilterCategory,
    String? errorCategory,
    String? keyword,
    String? message,
    bool? didLogout,
    bool clearMessage = false,
  }) {
    return HomeState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      total: total ?? this.total,
      enablePullup: enablePullup ?? this.enablePullup,
      isLoading: isLoading ?? this.isLoading,
      showFilter: showFilter ?? this.showFilter,
      isBack: isBack ?? this.isBack,
      isFilterCategory: isFilterCategory ?? this.isFilterCategory,
      isButtonLoading: isButtonLoading ?? this.isButtonLoading,
      isEditCategory: isEditCategory ?? this.isEditCategory,
      keyword: keyword ?? this.keyword,
      errorCategory: errorCategory ?? this.errorCategory,
      message: clearMessage ? null : (message ?? this.message),
      didLogout: didLogout ?? this.didLogout,
    );
  }

  @override
  List<Object?> get props => [
        products,
        categories,
        selectedCategory,
        pageIndex,
        pageSize,
        total,
        isBack,
        isFilterCategory,
        enablePullup,
        isLoading,
        showFilter,
        isButtonLoading,
        isEditCategory,
        errorCategory,
        keyword,
        message,
        didLogout,
      ];
}
