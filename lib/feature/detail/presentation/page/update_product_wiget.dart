part of 'detail_product_page.dart';

Widget _buildBody(BuildContext context, DetailProductBloc bloc) {
  return SingleChildScrollView(
    child: Form(
      key: bloc.formKey,
      child: Column(
        children: [
          buildImage(bloc),
          sdsSBHeight16,
          buildNameProduct(bloc),
          sdsSBHeight16,
          buildCodeProduct(bloc),
          sdsSBHeight16,
          buildPriceProduct(bloc),
          sdsSBHeight16,
          buildStockProduct(bloc),
          sdsSBHeight16,
          buildCategoryProduct(context, bloc),
          sdsSBHeight16,
          buildDescriptionProduct(bloc),
        ],
      ).paddingAll(AppDimens.padding16),
    ),
  );
}

Widget buildImagePicker(DetailProductBloc bloc) {
  return DottedBorder(
    color: Colors.grey,
    strokeWidth: 1,
    dashPattern: const [6, 4],
    borderType: BorderType.RRect,
    radius: const Radius.circular(12),
    child: GestureDetector(
        onTap: () {
          bloc.add(UpImage());
        },
        child: Stack(
          children: [
            bloc.state.isImage
                ? buildDetailImage(bloc.state.url)
                : Container(
                    width: double.infinity,
                    height: 150,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.image, color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Thêm ảnh",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),

            /// Loading overlay
            if (bloc.state.isUploadingImage)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.basicWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColors,
                    ),
                  ),
                ),
              )
          ],
        )),
  );
}

Widget buildImage(DetailProductBloc bloc) {
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildImagePicker(bloc),
      ],
    ),
  );
}

Widget buildNameProduct(DetailProductBloc bloc) {
  return SDSInputWithLabel.buildInputData(
    validator: bloc.validateName,
    heightInput: AppDimens.height45,
    textEditingController: bloc.inputNameCtrl,
    currentNode: bloc.fcsName,
    hintText: "Tên sản phẩm",
    title: "Tên sản phẩm",
    borderRadius: AppDimens.borderRadiusBig,
    paddingBottom: 0,
    isValidate: false,
    isValidateText: true,
    onChanged: (_) {},
  ).paddingSymmetric(vertical: AppDimens.padding2);
}

Widget buildCodeProduct(DetailProductBloc bloc) {
  return SDSInputWithLabel.buildInputData(
    validator: bloc.validateCode,
    heightInput: AppDimens.height45,
    textEditingController: bloc.inputCodeCtrl,
    currentNode: bloc.fcsCode,
    hintText: "Mã code sản phẩm",
    title: "Mã code sản phẩm",
    borderRadius: AppDimens.borderRadiusBig,
    paddingBottom: 0,
    isValidate: false,
    isValidateText: true,
    onChanged: (_) {},
  ).paddingSymmetric(vertical: AppDimens.padding2);
}

Widget buildPriceProduct(DetailProductBloc bloc) {
  return SDSInputWithLabel.buildInputData(
    validator: bloc.validatePrice,
    heightInput: AppDimens.height45,
    textEditingController: bloc.inputPriceCtrl,
    currentNode: bloc.fcsPrice,
    title: "Giá sản phẩm",
    hintText: "Giá sản phẩm (VND)",
    borderRadius: AppDimens.borderRadiusBig,
    textInputType: TextInputType.number,
    paddingBottom: 0,
    isValidate: false,
    isValidateText: true,
    onChanged: (_) {},
  ).paddingSymmetric(vertical: AppDimens.padding2);
}

Widget buildStockProduct(DetailProductBloc bloc) {
  return SDSInputWithLabel.buildInputData(
    validator: bloc.validateStock,
    heightInput: AppDimens.height45,
    textEditingController: bloc.inputStockCtrl,
    currentNode: bloc.fcsStock,
    title: "Số lượng sản phẩm",
    hintText: "Số lượng sản phẩm",
    borderRadius: AppDimens.borderRadiusBig,
    textInputType: TextInputType.number,
    paddingBottom: 0,
    isValidate: false,
    isValidateText: true,
    onChanged: (_) {},
  ).paddingSymmetric(vertical: AppDimens.padding2);
}

Widget buildDescriptionProduct(DetailProductBloc bloc) {
  return IconLeadingTextField(
    label: "Mô tả",
    controller: bloc.descriptionCtrl,
    backgroundColor: AppColors.basicWhite,
  );
}

Widget buildCategoryProduct(BuildContext context, DetailProductBloc bloc) {
  final selectedValue = bloc.state.selectedCategory;
  final Color color =
      selectedValue == null ? AppColors.basicGrey2 : AppColors.mainColors;
  final Color textColor =
      selectedValue == null ? AppColors.basicBlack : AppColors.mainColors;
  return UtilWidget.baseDropDownBottomSheetFilter(context,
      height: AppDimens.height45,
      title: "Danh mục sản phẩm",
      borderColor: color,
      iconColor: textColor,
      textColor: textColor,
      backgroundColor:
          selectedValue == null ? AppColors.basicGrey5 : AppColors.basicWhite,
      value: selectedValue?.name ?? "Danh mục", onTap: () async {
    final result = await showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.basicWhite,
      isScrollControlled: true,
      builder: (_) {
        return BlocBuilder<DetailProductBloc, DetailProductState>(
          bloc: bloc,
          builder: (context, state) {
            return buildBottomSheetCategoryProduct(context, bloc);
          },
        );
      },
    );
    if (result == null) {
      bloc.state.selectedCategory;
    }
    return result;
  });
}

Widget buildBottomSheetCategoryProduct(
    BuildContext context, DetailProductBloc bloc) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.7,
    child: UtilWidget.buildSelectionBottomSheet(
      context,
      title: "Chọn danh mục",
      items: bloc.state.listCategory ?? [],
      isAddItem: true,
      addItem: "Thêm danh mục +",
      onTap: () {
        ShowPopup.showDiaLogTextField(
          context,
          "Thêm Danh mục",
          "Lưu",
          onConfirm: () {
            bloc.add(CreateCategory());
            Navigator.pop(context);
          },
          hintText: "Danh mục mới",
          isActiveBack: true,
          bloc.inputCategoryCtrl,
          bloc.fcsCategory,
        );
      },
      isLoading: bloc.state.isLoading,
      checkSelected: (item) => bloc.state.selectedCategory?.id == item.id,
      itemTitleMapper: (item) => item.name ?? '',
      onItemSelected: (item) => bloc.add(UpdateSelectedCategory(item)),
      onConfirm: () {
        Navigator.pop(context);
      },
    ),
  );
}

Widget buildBottomBar(DetailProductBloc bloc) {
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
        Spacer(),
        ButtonUtils.buildButton(
          width: 120,
          "Lưu",
          () {
            bloc.add(ProductUpdateOrCreate());
          },
          backgroundColor: AppColors.mainColors,
          showLoading: true,
          colorText: AppColors.basicWhite,
          height: AppDimens.btnMediumTbSmall,
          borderRadius: BorderRadius.circular(AppDimens.radius12),
        ).paddingAll(AppDimens.padding16),
      ],
    ),
  );
}
