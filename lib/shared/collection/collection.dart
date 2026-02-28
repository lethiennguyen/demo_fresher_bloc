import 'dart:ui';

import '../../assets.dart';
import '../shares.src.dart';

/// class chứa các collection
class AppCollection {
  static Map<String, Color> mapColorBackgroundSnackBar = {
    AppConst.actionSuccess: AppColors.backgroundSuccess,
    AppConst.actionFail: AppColors.backgroundFail,
    AppConst.actionWarning: AppColors.backgroundWarning,
    AppConst.actionNotification: AppColors.btnBlueColor,
  };

  static Map<String, Color> mapColorBorderSnackBar = {
    AppConst.actionSuccess: AppColors.statusGreen,
    AppConst.actionFail: AppColors.statusRed,
    AppConst.actionWarning: AppColors.statusYellow,
    AppConst.actionNotification: AppColors.textBtnBlueColor,
  };
  static Map<String, String> mapIconSnackBar = {
    AppConst.actionSuccess: Assets.ASSETS_ICONS_IC_SNACK_BAR_SUCCESS_SVG,
    AppConst.actionFail: Assets.ASSETS_ICONS_IC_SNACK_BAR_FAILURE_SVG,
    AppConst.actionWarning: Assets.ASSETS_ICONS_ICON_SNACK_BAR_WARNING_SVG,
    AppConst.actionNotification:
        Assets.ASSETS_ICONS_ICON_SNACK_BAR_NOTIFICATION_SVG,
  };
}
