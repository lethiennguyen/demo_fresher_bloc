import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../core/values/app_string.dart';
import '../../../../lib.dart';
import '../../../detail/domain/domain.src.dart';
import '../../../detail/presentation/event/event.src.dart';
import '../../../home/domain/domain.src.dart';
import '../../../home/presentation/bloc/home_event.dart';
import '../../../home/presentation/bloc/home_state.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase useCase;
  late final StreamSubscription _sub;
  final RefreshController refreshController = RefreshController();
  final ScrollController scrollController = ScrollController();

  final TextEditingController inputSearchCtrl = TextEditingController();
  final TextEditingController categoryCtrl = TextEditingController();

  final FocusNode fcsCategory = FocusNode();
  final FocusNode fcsSearch = FocusNode();

  HomeBloc(this.useCase) : super(HomeState.initial()) {
    on<HomeStarted>(_onStarted);
    on<HomeFetchCategoriesRequested>(_onRefreshCategories);
    on<HomeRefreshRequested>(_onRefresh);
    on<HomeLoadMoreRequested>(_onLoadMore);
    on<HomeFilterByCategoryRequested>(_onFilterByCategory);

    on<HomeCreateCategoryRequested>(_onCreateCategory);
    on<HomeUpdateCategoryRequested>(_onUpdateCategory);
    on<HomeDeleteCategoryRequested>(_onDeleteCategory);

    on<HomeDeleteProductRequested>(_onDeleteProduct);

    on<HomeToggleEditCategory>(_onToggleEditCategory);
    on<HomeCategorySelected>(_onCategorySelected);

    on<HomeSearchChanged>(_onSearchChanged,
        transformer: debounce(const Duration(milliseconds: 300)));

    on<HomeLogoutRequested>(_onLogout);

    on<HomeMessageConsumed>((event, emit) {
      emit(state.copyWith(clearMessage: true));
    });

    on<OpenFilter>(onFilter);

    // EventBus listen (tương đương GetX onInit)
    _sub = EventBusUtils().on().listen((event) {
      if (event is DeleteProductEvent) {
        add(const HomeRefreshRequested());
      }
      if (event is CreateCategoryEvent) {
        add(const HomeFetchCategoriesRequested());
      }
    });
  }

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) async {
    add(const HomeFetchCategoriesRequested());
    add(const HomeRefreshRequested());
  }

  Future<void> _onFetchCategories(
      HomeFetchCategoriesRequested event, Emitter<HomeState> emit) async {
    final result = await useCase.categoriesUseCase.execute();
    if (result.isNotEmpty) {
      emit(state.copyWith(categories: result));
    } else {
      emit(state.copyWith(message: "Không có danh mục"));
    }
  }

  Future<void> _onRefreshCategories(
      HomeFetchCategoriesRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isButtonLoading: true));
    await _onFetchCategories(event, emit);
    emit(state.copyWith(isButtonLoading: false));
  }

  Future<void> _onRefresh(
      HomeRefreshRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      pageIndex: 1,
      total: 0,
      enablePullup: true,
      products: const [],
    ));
    await _fetchProducts(emit, categoryId: state.selectedCategory?.id);

    emit(state.copyWith(isLoading: false));

    refreshController.refreshCompleted();
  }

  Future<void> _onLoadMore(
      HomeLoadMoreRequested event, Emitter<HomeState> emit) async {
    if (!state.enablePullup) return;

    emit(state.copyWith(pageIndex: state.pageIndex + 1));
    await _fetchProducts(emit, categoryId: state.selectedCategory?.id);

    refreshController.loadComplete();
  }

  Future<void> _onFilterByCategory(
      HomeFilterByCategoryRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
      isLoading: true,
      pageIndex: 1,
      total: 0,
      enablePullup: true,
      products: const [],
    ));

    await _fetchProducts(emit, categoryId: event.categoryId);

    emit(state.copyWith(isLoading: false));
  }

  Future<void> _fetchProducts(Emitter<HomeState> emit,
      {int? categoryId}) async {
    final entity = ListProductRequestEntity(
      categoryId: categoryId,
      keyword: state.keyword,
      page: state.pageIndex,
      pageSize: state.pageSize,
    );

    final response = await useCase.listProductItemUseCase.execute(entity);
    if (response == null) return;

    final newList = List<ProductEntity>.from(state.products)..addAll(response);

    final hasMore = response.length == state.pageSize;
    final newTotal = state.total + response.length;

    emit(state.copyWith(
      products: newList,
      total: newTotal,
      enablePullup: hasMore,
    ));
    if (!hasMore) {
      emit(state.copyWith(enablePullup: false));
      refreshController.loadNoData();
    }
  }

  void _onToggleEditCategory(
      HomeToggleEditCategory event, Emitter<HomeState> emit) {
    emit(state.copyWith(
      isEditCategory: !state.isEditCategory,
      errorCategory: '',
    ));
  }

  void _onCategorySelected(
      HomeCategorySelected event, Emitter<HomeState> emit) {
    emit(state.copyWith(selectedCategory: event.category, errorCategory: ''));
  }

  Future<void> _onCreateCategory(
      HomeCreateCategoryRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isButtonLoading: true));
    try {
      final entity = CategoryRequestEntity(name: event.name.trim());
      final result = await useCase.createCategoryUseCase.execute(entity);

      if (result.data != null) {
        add(const HomeFetchCategoriesRequested());
      } else {
        emit(state.copyWith(
            message: result.message ?? "Thêm danh mục không thành công"));
      }
    } catch (_) {
      emit(state.copyWith(message: "Thêm danh mục không thành công"));
    } finally {
      emit(state.copyWith(isButtonLoading: false));
    }
  }

  Future<void> _onUpdateCategory(
      HomeUpdateCategoryRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isButtonLoading: true));
    try {
      final entity =
          CategoryRequestEntity(id: event.id, name: event.name.trim());
      final result = await useCase.updateCategoryUseCase.execute(entity);

      if (result.data != null) {
        add(const HomeFetchCategoriesRequested());
      } else {
        emit(state.copyWith(
            message: result.message ?? "Cập nhật danh mục không thành công"));
      }
    } catch (_) {
      emit(state.copyWith(message: "Cập nhật danh mục không thành công"));
    } finally {
      emit(state.copyWith(isButtonLoading: false));
    }
  }

  Future<void> _onDeleteProduct(
      HomeDeleteProductRequested event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final entity = DeleteProductEntity(id: event.id);
      final response = await useCase.deleteProductUseCase.execute(entity);

      if (response.data == true) {
        emit(state.copyWith(message: LocaleKeys.add_tasks_delete_success));
        add(const HomeRefreshRequested());
      } else {
        emit(state.copyWith(message: response.message ?? "Xóa thất bại"));
      }
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> _onDeleteCategory(
      HomeDeleteCategoryRequested event, Emitter<HomeState> emit) async {
    if (state.selectedCategory == null) {
      emit(state.copyWith(errorCategory: "Hãy chọn danh mục để xóa"));
      return;
    }
    emit(state.copyWith(isButtonLoading: true));
    try {
      final response = await useCase.deleteCategoryUseCase
          .execute(DeleteCategoryEntity(id: event.id));
      if (response.data == true) {
        emit(state.copyWith(message: "Xóa danh mục thành công"));
        add(const HomeFetchCategoriesRequested());
      } else {
        emit(state.copyWith(message: response.message ?? "Xóa thất bại"));
      }
    } finally {
      emit(state.copyWith(isButtonLoading: false));
    }
  }

  Future<void> _onSearchChanged(
      HomeSearchChanged event, Emitter<HomeState> emit) async {
    emit(state.copyWith(
        keyword: event.keyword,
        isLoading: true,
        pageIndex: 1,
        total: 0,
        enablePullup: true,
        products: const []));
    await _fetchProducts(emit, categoryId: state.selectedCategory?.id);
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _onLogout(
      HomeLogoutRequested event, Emitter<HomeState> emit) async {
    final ok = await useCase.logoutUseCase.execute();
    if (ok) {
      emit(state.copyWith(didLogout: true));
    }
  }

  void onFilter(OpenFilter event, Emitter<HomeState> emit) {
    emit(state.copyWith(showFilter: !state.showFilter));
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
