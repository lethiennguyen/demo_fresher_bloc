import 'package:demo_fresher_bloc/lib.dart';
import 'package:flutter/material.dart';

class FilterListProduct {
  static Widget fillter(
    BuildContext context, {
    Widget? body,
    Widget? widgetConfirm,
    VoidCallback? onEdit,
    VoidCallback? onReload,
    String? title,
    String? edit,
  }) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          color: AppColors.basicWhite,
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey,
              width: 0.5,
            ),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onReload,
                child: Row(
                  children: [
                    TextUtils(
                      text: title ?? "",
                      availableStyle: StyleEnum.t16Bold,
                    ),
                    sdsSBWidth4,
                    Icon(
                      Icons.loop_sharp,
                      color: AppColors.mainColors,
                      size: AppDimens.sizeIconSmall,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onEdit,
                child: Row(
                  children: [
                    TextUtils(
                      text: edit ?? "",
                      color: AppColors.mainColors,
                      availableStyle: StyleEnum.t16Bold,
                    ),
                    sdsSBWidth2,
                    Icon(
                      Icons.edit,
                      color: AppColors.mainColors,
                      size: AppDimens.sizeIconSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
          sdsSBHeight15,
          Expanded(child: body ?? SizedBox()),
          sdsSBHeight15,
          widgetConfirm ?? SizedBox(),
        ],
      ).paddingOnly(
          left: AppDimens.padding16,
          right: AppDimens.padding16,
          top: AppDimens.padding16),
    );
  }
}
