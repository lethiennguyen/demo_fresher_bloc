part of 'detail_product_page.dart';

Widget buildDetailItem({
  required String title,
  required String value,
  bool isLast = false,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: title,
        availableStyle: StyleEnum.t14Regular,
        color: AppColors.basicGrey2,
      ),
      sdsSB4,
      TextUtils(
        text: value.isEmpty ? "" : value,
        availableStyle: StyleEnum.t16Bold,
        color: AppColors.basicBlack,
        maxLine: 50,
      ),
      if (!isLast) ...[
        sdsSBHeight16,
        dividerBase,
        sdsSBHeight16,
      ]
    ],
  );
}

Widget buildDetailImage(String imageUrl) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Image.network(
      imageUrl,
      width: double.infinity,
      height: AppDimens.imageDetailHeight180,
      fit: BoxFit.fill,
      errorBuilder: (context, error, stackTrace) => Container(
        width: double.infinity,
        height: AppDimens.imageDetailHeight200,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(AppDimens.padding12),
        ),
        child: const Icon(Icons.image_not_supported,
            color: Colors.grey, size: AppDimens.sizeIconLargeTB),
      ),
    ),
  );
}

Widget buildProductDetailBody(DetailProductBloc bloc) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailImage(bloc.state.product?.image ?? ""),

        sdsSBHeight20,

        // Giá + Kho
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextUtils(
              text: formatCurrency(bloc.state.product?.price),
              color: AppColors.mainColors,
              availableStyle:
                  StyleEnum.t24Bold, // giảm từ t28 → t24 cho cân đối
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.padding8, vertical: AppDimens.padding4),
              decoration: BoxDecoration(
                color: AppColors.mainColors.withOpacity(0.08),
                borderRadius: BorderRadius.circular(AppDimens.padding20),
              ),
              child: TextUtils(
                text:
                    "${LocaleKeys.product_stock_label} ${bloc.state.product?.stock?.toString() ?? "0"}",
                availableStyle: StyleEnum.t13Bold,
                color: AppColors.mainColors,
              ),
            ),
          ],
        ),

        sdsSBHeight10,

        // Tên sản phẩm + mã
        TextUtils(
          text:
              "${LocaleKeys.product_code_label} [${bloc.state.product?.code ?? ""}]",
          availableStyle: StyleEnum.t13Regular,
          color: AppColors.grey,
        ),
        sdsSBHeight4,
        TextUtils(
          text: bloc.state.product?.name ?? "",
          availableStyle: StyleEnum.t18Bold,
          color: AppColors.textPrimary,
          maxLine: 4,
        ),

        sdsSBHeight20,
        dividerBase,
        if (bloc.state.product?.category?.name != null)
          buildDetailItem(
            title: LocaleKeys.product_category_default,
            value: bloc.state.product?.category?.name ?? "",
            isLast: true,
          ),
        sdsSBHeight16,
        if (bloc.state.product?.description != null &&
            bloc.state.product?.description != "") ...[
          buildDetailItem(
            title: LocaleKeys.product_description,
            value: bloc.state.product?.description ?? "",
          ),
          sdsSBHeight12,
        ],
      ],
    ).paddingAll(AppDimens.padding16),
  );
}

Widget buildBottomBarDetail(BuildContext context, DetailProductBloc bloc) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(
          color: AppColors.grey,
          width: 0.5,
        ),
      ),
      color: AppColors.basicWhite,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: ButtonUtils.buildButton(
            LocaleKeys.task_remove,
            () {
              UtilWidget.showConfirmDialog(
                context,
                title: LocaleKeys.product_delete_title,
                subtitle: LocaleKeys.product_delete_confirm,
                typeAction: AppConst.actionFail,
                onCancel: () => Navigator.pop(context),
                onConfirm: () {
                  Navigator.pop(context);
                  bloc.add(DeleteProduct(bloc.state.product?.id));
                },
              );
            },
            backgroundColor: AppColors.basicWhite,
            showLoading: true,
            colorText: AppColors.overdueColor,
            height: AppDimens.btnMediumTbSmall,
            border: Border.all(
              color: AppColors.overdueColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(AppDimens.radius12),
          ).paddingAll(AppDimens.padding16),
        ),
        sdsSBWidth5,
        Expanded(
          child: ButtonUtils.buildButton(
            LocaleKeys.task_edit,
            () {
              bloc.add(OnEditPressed());
            },
            backgroundColor: AppColors.mainColors,
            showLoading: true,
            colorText: AppColors.basicWhite,
            height: AppDimens.btnMediumTbSmall,
            borderRadius: BorderRadius.circular(AppDimens.radius12),
          ).paddingAll(AppDimens.padding16),
        ),
      ],
    ),
  );
}

String formatCurrency(double? price) {
  if (price == null) return "-";
  return "${price.toStringAsFixed(0)} đ";
}
