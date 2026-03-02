part of 'home_page.dart';

Widget _buildHomeBody(BuildContext context, HomeBloc bloc) {
  return Column(
    children: [
      _buildFilterStatus(context, bloc),
      sdsSBWidth16,
      Expanded(
        child: Stack(
          children: [
            _buildListProduct(context, bloc),
            ClipRect(
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                offset:
                    bloc.state.showFilter ? Offset.zero : const Offset(0, -1),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: bloc.state.showFilter ? 1 : 0,
                  child: _buildFilter(context, bloc),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildFilterStatus(BuildContext context, HomeBloc bloc) {
  return UtilWidget.baseCard(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: SDSInputWithLabel.buildInputData(
            validator: null,
            heightInput: AppDimens.heightInput,
            textEditingController: bloc.inputSearchCtrl,
            currentNode: bloc.fcsSearch,
            hintText: LocaleKeys.task_search_task,
            borderRadius: AppDimens.borderRadiusBig,
            paddingBottom: 0,
            isValidate: false,
            isValidateText: false,
            onChanged: (text) {
              context.read<HomeBloc>().add(HomeSearchChanged(text));
            },
          ).paddingSymmetric(vertical: AppDimens.padding2),
        ),
        ButtonUtils.buildFilterButton(
          onPressed: () => context.read<HomeBloc>().add(OpenFilter()),
          selected: bloc.state.showFilter,
        )
      ],
    ).paddingSymmetric(horizontal: AppDimens.padding6),
  );
}

// ===== FILTER PANEL =====
Widget _buildFilter(BuildContext context, HomeBloc bloc) {
  return FilterListProduct.fillter(
    context,
    title: "Danh mục",
    edit: "Chỉnh sửa",
    onEdit: () => context.read<HomeBloc>().add(const HomeToggleEditCategory()),
    onReload: () => bloc.add(const HomeFetchCategoriesRequested()),
    body: _buildBodyFilter(context, bloc),
    widgetConfirm: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (bloc.state.errorCategory.isNotEmpty)
          TextUtils(
            text: bloc.state.errorCategory,
            color: AppColors.overdueColor,
          ),
        sdsSBHeight4,
        bloc.state.isEditCategory
            ? _buildButtonEditCategory(context, bloc)
            : _buildButtonFilter(context, bloc),
        sdsSBHeight4,
      ],
    ),
  );
}

Widget _buildBodyFilter(BuildContext context, HomeBloc bloc) {
  if (bloc.state.isButtonLoading) {
    return _buildSkeletonCategory();
  }

  return SingleChildScrollView(
    child: Center(
      child: Wrap(
        spacing: AppDimens.padding18,
        runSpacing: 13,
        children: [
          ...bloc.state.categories.map((item) {
            final selected = bloc.state.selectedCategory?.id == item.id;

            return GestureDetector(
              onTap: () {
                final newSelected = selected ? null : item;
                bloc.add(HomeCategorySelected(newSelected));
              },
              child: Container(
                height: AppDimens.height35,
                width: AppDimens.sizeIconBig,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selected ? AppColors.mainColors : AppColors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(AppDimens.radius12),
                  color:
                      selected ? AppColors.basicWhite : AppColors.greyItemColor,
                ),
                child: Center(
                  child: TextUtils(
                    text: item.name ?? '',
                    color:
                        selected ? AppColors.mainColors : AppColors.basicBlack,
                    availableStyle: StyleEnum.t14Bold,
                  ),
                ),
              ),
            );
          }),

          // add category
          GestureDetector(
            onTap: () => _showDialogCreateCategory(context, bloc),
            child: UtilWidget.baseCard(
              height: AppDimens.height35,
              width: AppDimens.height45,
              padding: EdgeInsets.zero,
              border: Border.all(color: AppColors.mainColors, width: 0.8),
              borderRadius: AppDimens.radius12,
              backgroundColor: AppColors.basicWhite,
              child: Icon(Icons.add, color: AppColors.mainColors),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildButtonFilter(BuildContext context, HomeBloc bloc) {
  return ButtonUtils.buildFooterButtons(
    context,
    textCancel: "Thiết lập lại",
    textConfirm: LocaleKeys.button_confirm,
    onCancel: () {
      bloc.add(const HomeCategorySelected(null));
      bloc.add(const HomeFilterByCategoryRequested(null));
      bloc.add(const OpenFilter(showFilter: false));
    },
    onConfirm: () {
      final id = context.read<HomeBloc>().state.selectedCategory?.id;
      context.read<HomeBloc>().add(HomeFilterByCategoryRequested(id));
      bloc.add(const OpenFilter(showFilter: false));
    },
  );
}

Widget _buildButtonEditCategory(BuildContext context, HomeBloc bloc) {
  return Row(
    children: [
      Expanded(
        flex: 3,
        child: ButtonUtils.buildButton(
          "Hủy",
          () => context.read<HomeBloc>().add(const HomeToggleEditCategory()),
          backgroundColor: AppColors.basicWhite,
          showLoading: true,
          colorText: AppColors.mainColors,
          height: AppDimens.btnMediumTbSmall,
          borderRadius: BorderRadius.circular(AppDimens.radius12),
        ),
      ),
      sdsSBWidth60,
      Expanded(
        flex: 7,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ButtonUtils.buildButton(
                "Xóa",
                () => _showDialogDeleteCategory(context, bloc),
                padding: EdgeInsets.zero,
                height: AppDimens.btnMediumTbSmall,
                width: AppDimens.btnMediumTbSmall,
                border: Border.all(color: AppColors.mainColors, width: 2),
                backgroundColor: AppColors.basicWhite,
                colorText: AppColors.mainColors,
                borderRadius: BorderRadius.circular(AppDimens.radius12),
              ),
            ),
            sdsSBWidth12,
            Expanded(
              flex: 3,
              child: ButtonUtils.buildButton(
                "Cập nhật",
                () => _showDialogUpdateCategory(context, bloc),
                backgroundColor: AppColors.mainColors,
                colorText: AppColors.basicWhite,
                height: AppDimens.btnMediumTbSmall,
                borderRadius: BorderRadius.circular(AppDimens.radius12),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _buildListProduct(BuildContext context, HomeBloc bloc) {
  if (bloc.state.isLoading && bloc.state.products.isEmpty) {
    return _buildSkeletonListProduct();
  }

  return UtilWidget.buildSmartRefresher(
    scrollController: bloc.scrollController,
    refreshController: RefreshController(),
    onRefresh: () => context.read<HomeBloc>().add(const HomeRefreshRequested()),
    onLoadMore: () =>
        context.read<HomeBloc>().add(const HomeLoadMoreRequested()),
    enablePullDown: true,
    enablePullUp: bloc.state.enablePullup,
    shimmer: ProductSkeletonCard(),
    child: ListView.builder(
      padding: const EdgeInsets.all(12),
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount:
          bloc.state.products.length + (bloc.state.products.isEmpty ? 1 : 0),
      itemBuilder: (context, index) {
        if (bloc.state.products.isEmpty) {
          return Center(child: TextUtils(text: "Không có dữ liệu"));
        }

        final item = bloc.state.products[index];
        return _buildProductCard(
          context,
          item,
          onTap: () => Navigator.pushNamed(context, AppRouter.routerDetail,
              arguments: item),
          onDelete: () {
            bloc.add(HomeDeleteProductRequested(item.id));
            Navigator.pop(context);
          },
        ).paddingOnly(bottom: AppDimens.padding8);
      },
    ),
  );
}

// ===== dialogs create/update/delete category =====
void _showDialogCreateCategory(BuildContext context, HomeBloc bloc) {
  bloc.categoryCtrl.clear();
  ShowPopup.showDiaLogTextField(
    context,
    "Tạo danh mục",
    "Lưu",
    onConfirm: () {
      context
          .read<HomeBloc>()
          .add(HomeCreateCategoryRequested(bloc.categoryCtrl.text));
      Navigator.pop(context);
    },
    hintText: "Danh mục mới",
    isActiveBack: true,
    bloc.categoryCtrl,
    bloc.fcsCategory,
  );
}

void _showDialogUpdateCategory(BuildContext context, HomeBloc bloc) {
  if (bloc.state.selectedCategory == null) {
    // bắn lỗi lên state để UI hiện
    // nhanh gọn: show ngay snackbar
    UtilWidget.showSnackBar(
      title: LocaleKeys.notification_title,
      message: "Hãy chọn danh mục để cập nhật",
    );
    return;
  }

  bloc.categoryCtrl.text = bloc.state.selectedCategory?.name ?? '';
  ShowPopup.showDiaLogTextField(
    context,
    "Cập nhật danh mục",
    "Lưu",
    onConfirm: () {
      context.read<HomeBloc>().add(
            HomeUpdateCategoryRequested(
              id: bloc.state.selectedCategory?.id,
              name: bloc.categoryCtrl.text,
            ),
          );
      Navigator.pop(context);
    },
    hintText: "Danh mục mới",
    isActiveBack: true,
    bloc.categoryCtrl,
    bloc.fcsCategory,
  );
}

void _showDialogDeleteCategory(BuildContext context, HomeBloc bloc) {
  if (bloc.state.selectedCategory == null) {
    UtilWidget.showSnackBar(
      title: LocaleKeys.notification_title,
      message: "Hãy chọn danh mục để xóa",
    );
    return;
  }

  UtilWidget.showConfirmDialog(
    context,
    title: "Xóa danh mục",
    subtitle: "Bạn có muỗn xóa không",
    typeAction: AppConst.actionFail,
    onCancel: () => Navigator.pop(context),
    onConfirm: () {
      Navigator.pop(context);
      context
          .read<HomeBloc>()
          .add(HomeDeleteCategoryRequested(bloc.state.selectedCategory?.id));
    },
  );
}

// ===== floating button =====
Widget buildFloatingActionButton(BuildContext context) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, AppRouter.routerDetail),
    child: UtilWidget.baseCard(
      height: AppDimens.sizeIconLargeTB,
      width: AppDimens.sizeIconLargeTB,
      backgroundColor: AppColors.mainColors,
      borderRadius: AppDimens.borderRadius40,
      child: const Icon(Icons.add, color: AppColors.basicWhite),
    ),
  );
}

Widget _buildSkeletonListProduct() {
  return ListView.builder(
    padding: const EdgeInsets.all(12),
    itemCount: 6,
    itemBuilder: (context, index) {
      return ProductSkeletonCard();
    },
  );
}

Widget _buildSkeletonCategory() {
  return Skeletonizer(
    enabled: true,
    child: Center(
      child: Wrap(
        spacing: AppDimens.padding18,
        runSpacing: 13,
        children: List.generate(
          10,
          (index) => Container(
            height: AppDimens.height35,
            width: AppDimens.sizeIconBig,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.radius12),
              color: AppColors.greyItemColor,
            ),
            child: Center(
              child: TextUtils(text: "Category"),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildIconButton(VoidCallback onTap,
    {String? asset,
    IconData? icon,
    double size = 30,
    EdgeInsets padding = const EdgeInsets.all(8),
    bool isIcon = false}) {
  return IconButton(
    onPressed: onTap,
    padding: padding,
    constraints: const BoxConstraints(),
    icon: isIcon
        ? Icon(
            icon,
            size: size,
            color: AppColors.mainColors,
          )
        : SvgPicture.asset(
            asset!,
            width: size,
            height: size,
          ),
  );
}

Widget _buildProductCard(BuildContext context, ProductEntity entity,
    {VoidCallback? onTap, VoidCallback? onDelete}) {
  return UtilWidget.baseCard(
    borderRadius: AppDimens.borderRadius16,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        spreadRadius: 1,
        offset: const Offset(0, 2),
      ),
    ],
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Ảnh sản phẩm
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              entity.image ?? '',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 90,
                height: 90,
                color: Colors.grey[100],
                child: const Icon(Icons.image_not_supported,
                    color: Colors.grey, size: 32),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // 2. Thông tin chi tiết
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tên sản phẩm
                      TextUtils(
                        text: entity.name ?? '',
                        availableStyle: StyleEnum.t15Bold,
                        maxLine: 1,
                        color: AppColors.textPrimary,
                      ),
                      sdsSBHeight4,

                      // Mô tả
                      TextUtils(
                        text: entity.description ?? '',
                        availableStyle: StyleEnum.t12Regular,
                        color: AppColors.grey,
                        maxLine: 2,
                      ),
                      sdsSBHeight8,

                      // Giá
                      TextUtils(
                        text: entity.price.toString(),
                        availableStyle: StyleEnum.t15Bold,
                        color: AppColors.mainColors,
                      ),
                      sdsSBHeight4,

                      Row(
                        children: [
                          Icon(Icons.inventory_2_outlined,
                              size: 13, color: AppColors.grey),
                          sdsSBWidth4,
                          TextUtils(
                            text: "Kho: ${entity.stock ?? 0}",
                            availableStyle: StyleEnum.t12Regular,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Nút xóa
                buildIconButton(
                  () {
                    UtilWidget.showConfirmDialog(
                      context,
                      title: LocaleKeys.add_tasks_delete_task,
                      subtitle: LocaleKeys.add_tasks_confirm_delete_task,
                      typeAction: AppConst.actionFail,
                      onCancel: () => Navigator.pop(context),
                      onConfirm: onDelete,
                    );
                  },
                  icon: Icons.delete_outline,
                  isIcon: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
