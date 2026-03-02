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

Widget buildProductDetailBody(DetailProductState controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailImage(controller.product?.image ?? ""),

        sdsSBHeight20,

        // Giá + Kho
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextUtils(
              text: formatCurrency(controller.product?.price),
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
                text: "Kho: ${controller.product?.stock?.toString() ?? "0"}",
                availableStyle: StyleEnum.t13Bold,
                color: AppColors.mainColors,
              ),
            ),
          ],
        ),

        sdsSBHeight10,

        // Tên sản phẩm + mã
        TextUtils(
          text: "Mã [${controller.product?.code ?? ""}]",
          availableStyle: StyleEnum.t13Regular,
          color: AppColors.grey,
        ),
        sdsSBHeight4,
        TextUtils(
          text: controller.product?.name ?? "",
          availableStyle: StyleEnum.t18Bold,
          color: AppColors.textPrimary,
          maxLine: 4,
        ),

        sdsSBHeight20,
        dividerBase,
        if (controller.product?.category?.name != null)
          buildDetailItem(
            title: "Danh mục",
            value: controller.product?.category?.name ?? "",
            isLast: true,
          ),
        sdsSBHeight16,
        if (controller.product?.description != null &&
            controller.product?.description != "") ...[
          buildDetailItem(
            title: "Mô tả",
            value: controller.product?.description ?? "",
          ),
          sdsSBHeight12,
        ],
      ],
    ).paddingAll(AppDimens.padding16),
  );
}

Widget buildBottomBarDetail(DetailProductState controller) {
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
              //controller.showDialogDelete();
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
              //controller.onEditPressed();
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
