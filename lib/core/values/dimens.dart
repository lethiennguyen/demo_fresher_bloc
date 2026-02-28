// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// double ratioHeight = Get.height / AppDimens.heightDesign;
// // Tỉ lệ chiều ngang so với màn hình thiết kế
// double ratioWidth = Get.width / AppDimens.widthDesign;
//
// class AppDimens {
//   static const int heightDesign = 812;
//   static const int widthDesign = 375;
//
//   static const double heightInput = 53;
//
//   static double fontSize10() => 10.divSF;
//   static double fontSmallest() => 12.divSF;
//   static double fontSmall() => 14.divSF;
//   static double fontMedium() => 16.divSF;
//   static double fontBig() => 18.divSF;
//   static double fontBiggest() => 20.divSF;
//   static double fontSize24() => 24.divSF;
//   static double fontSize9() => 9.divSF;
//
//   static double fontSize13() => 13.divSF;
//
//   static double fontSize32() => 32.divSF;
//   static double fontSmallest12() => GetSizeScreen(12).divSF;
//
//   static double fontSmall14() => GetSizeScreen(14).divSF;
//
//   static final double paddingDevice =
//       GetPlatform.isIOS ? Get.mediaQuery.padding.bottom : paddingVerySmall;
//   static const double sizeImage = 50;
//   static const double sizeImageMedium = 70;
//   static const double sizeImageBig = 90;
//
//   static const double sizeImageLarge = 200;
//   static const double sizeImageMax = 300;
//
//   /// Button size
//   static const double btn10 = 10;
//   static const double btnSmall = 20;
//   static const double btnPopup = 32;
//   static const double btnMediumTb = 40;
//   static const double btnMediumSB = 45;
//   static const double btnMedium = 50;
//   static const double btnLarge = 70;
//   static const double btnDefault = 40;
//
//   static const double sizeImageLogo = 40;
//
//   // icon size
//   static const double sizeIcon = 20;
//   static const double sizeIconSmall = 12;
//   static const double sizeIcon16 = 16;
//   static const double sizeIconMedium = 24;
//   static const double sizeIconSpinner = 30;
//   static const double iconHeightButton = 38;
//   static const double sizeDialogNotiIcon = 40;
//
//   static const double heightChip = 30;
//   static const double widthChip = 100;
//
//   static const int maxLengthDescription = 250;
//
//   static const double defaultPadding = 16.0;
//   static const double paddingZero = 0;
//   static const double paddingIcon = 4.0;
//   static const double paddingVerySmall = 8.0;
//   static const double paddingSmall = 12.0;
//   static const double paddingSmalls = 2.0;
//   static const double paddingMedium = 20.0;
//   static const double paddingHuge = 32.0;
//   // static const double paddingBig = 22.0;
//
//   static const double showAppBarDetails = 200;
//   static const double sizeAppBarBig = 120;
//   static const double sizeAppBarMedium = 92;
//   static const double sizeAppBar = 72;
//   static const double sizeAppBarSmall = 44;
//
//   // radiusBorder
//   static const double radius8 = 8;
//   static const double radius4 = 4;
//   static const double radius20 = 20;
//   static const double radius25 = 25;
//   static const double radius30 = 30;
//   static const double radius100 = 100;
//   static const double borderDefault = 1;
//
//   // divider
//   static const double paddingDivider = 15.0;
//
//   // appbar
//   static const double paddingSearchBarBig = 50;
//   static const double paddingSearchBar = 45;
//   static const double paddingSearchBarMedium = 30;
//   static const double paddingSearchBarSmall = 10;
//
//   // page config print
//   static const double heightPageConfig = 0.85;
//   static const double widthPageConfig = 20;
//   static const double heightItem = 35;
//   static const double widthItem = 4;
//   static const int maxLength = 20;
//   static const int maxLengthMax = 50;
//
//   static const double sizeTextSmallest = 10;
//   static const double sizeTextSmaller = 12;
//   static const double sizeText13 = 13;
//   static const double sizeTextSmall = 14;
//   static const double sizeTextSmallTb = 15;
//   static const double sizeTextMediumTb = 16;
//   static const double sizeTextMedium = 18;
//   static const double sizeTextLarge = 20;
//   static const double sizeTextSupperLarge = 24;
//   static const double sizeNavigationBar = 90;
//
//   //padding
//   static const double padding6 = 6.0;
//   static const double padding12 = 12.0;
//   static const double padding14 = 14.0;
//   static const double padding10 = 10.0;
//   static const double padding15 = 15.0;
//   static const double padding16 = 16.0;
//   static const double padding17 = 17.0;
//   static const double padding30 = 30.0;
//   static const double padding38 = 38.0;
//   static const double padding40 = 40.0;
//   static const double padding25 = 25.0;
//   static const double padding20 = 20.0;
//   static const double padding22 = 22.0;
//   static const double padding28 = 28.0;
//   static const double padding9 = 9.0;
//   static const double padding5 = 5.0;
//   static const double padding2 = 2.0;
//   static const double padding3 = 3.0;
//   static const double padding4 = 4.0;
//   static const double padding8 = 8.0;
//   static const double scrollPadding = 150;
//
//   /// Tỉ lệ chiều cao so với màn hình thiết kế
//   static double ratioHeight = Get.height / heightDesign;
//
//   /// Tỉ lệ chiều ngang so với màn hình thiết kế
//   static double ratioWidth = Get.width / widthDesign;
//
//   /// Giá trị px màn hình Mobile design trên figma
//   static const double paddingSmallest = 4.0;
//
//   static const double paddingSmallTB = 30.0;
//   static const double paddingMediumTB = 50.0;
//
//   ///padding
//   static const double padding10Minus = -10.0;
//   static const double padding20Minus = -20.0;
//   static const double padding0 = 0.0;
//   static const double padding1 = 1.0;
//
//   static const double padding24 = 24.0;
//
//   static const double padding35 = 35.0;
//   static const double padding45 = 45.0;
//   static const double padding60 = 60.0;
//   static const double padding64 = 64.0;
//
//   static const double radius6 = 6;
//
//   static const double radius12 = 12;
//   static const double radius10 = 10;
//   static const double radius14 = 14;
//   static const double radius16 = 16;
//   static const double radius22 = 22;
//   static const double radius36 = 36;
//
//   ///text size
//   static const double sizeText10 = 10;
//   static const double sizeText12 = 12.5;
//   static const double sizeText14 = 14;
//   static const double sizeText15 = 15;
//   static const double sizeText16 = 16;
//   static const double sizeText18 = 18;
//   static const double sizeText19 = 19;
//   static const double sizeText20 = 20;
//   static const double sizeText24 = 24;
//   static const double sizeText28 = 28;
//   static const double sizeText30 = 30;
//
//   static const double sizeIconLoading = 25;
//
//   static const double sizeIconLoadingOver = 40;
//
//   static const double sizeTextDefault = 14;
//
//   static const double sizeTextLarger = 22;
//   static const double sizeTextLargerDaily = 24;
//
//   static const double btnMediumTbSmall = 40;
//
//   static const double sizeIconVerySmall = 12;
//
//   static const double sizeIcon28 = 28;
//   static const double sizeIconMedium23 = 23;
//   static const double sizeIcon24 = 24;
//   static const double sizeBodyMedium = 23;
//   static const double sizeIconMedium25 = 25;
//   static const double sizeIconLarge = 36;
//   static const double sizeIconLargeTB = 50;
//   static const double sizeIconBig = 80;
//   static const double sizeIconExtraLarge = 200;
//
//   static const double height35 = 35;
//   static const double height42 = 42;
//   static const double height45 = 45;
//   static const double height50 = 50;
//   static const double width0_5 = 0.5;
//   static const double width1 = 1.0;
//   static const double width2 = 2.0;
//   static const double withContainer = 100;
//   static const double heightContainer = 100;
//
//   static const double paddingVerySmallest = 4.0;
//   static const double padding50 = 50.0;
//   static const double padding23 = 23.0;
//   static const double paddingVeryHuge = 48.0;
//   static const double padding120 = 120.0;
//   static const double paddingItemList = 18.0;
//   static const double insetPadding = 62.0;
//   static const double borderSmall = 25.0;
//
//   static const double radiusImg = 220.0;
//   static const double sizeText = 16;
//
//   // radiusBorder
//   static const double radius5 = 5;
//   static const double radius50 = 50;
//
//   // home
//   static const double sizeItemNewsHome = 110;
//   static const double heightImageLogoHome = 50;
//
//   //other
//   static const double paddingTitleAndTextForm = 3;
//
//   static double bottomPadding() {
//     return Platform.isIOS ? AppDimens.paddingMedium : AppDimens.paddingSmall;
//   }
//
//   //MENU
//   //Positioned
//   static const double bottomPositioned = -5;
//   static const double rightPositioned = 18;
//   static const double opacityPositioned = 0.5;
//   static const double heightPositioned = 30;
//   static const double widthPositioned = 30;
//
//   //padding
//   static const double paddingOnlyLeft = 55.0;
//   static const double paddingOnlyRight = 8.0;
//   static const double paddingOnlyHorizontal = 8.0;
//   static const double padding3Horizontal = 3.0;
//   static const double paddingOnlyTop150 = 150.0;
//   static const double paddingBottom = 60.0;
//
//   //Sizedbox
//   static const double widthSizedBox = 80.0;
//   static const double heightSizedBox = 30.0;
//
//   static const double borderRadiusBigger = 10.0;
//   static const double borderRadiusBig = 8.0;
//   static const double borderRadiusMed = 5.0;
//   static const double borderRadiusSmall = 2.0;
//   static const double borderRadius12 = 12.0;
//   static const double borderRadius16 = 16.0;
//   static const double borderRadius20 = 20.0;
//   static const double borderRadius30 = 30.0;
//   static const double borderRadius40 = 40.0;
//   static const double borderCardDefault = 15.0;
//
//   // elevation
//   static const double elevationSmall = 1.0;
//   static const double elevationMed = 1.5;
//   static const double elevationLarge = 2.0;
//
//   static const int filterHeight = 6;
//   static const double heightBottomTabBar = 80;
//   static const double heightBottomTabBarAndroid = 65;
//   static const double sizeCustomIndicator = 50.0;
//   static const double sizeBorderNavi = 30.0;
//   static const double paddingTabBar = 5.0;
//   static const double paddingSmallBottomNavigation = 6.0;
//   static const double paddingBottomTabBar = 15.0;
//   static const double sizeBottomNavi80 = 80.0;
//
//   // dropdown
//   static const double heightDropDownDefault = 30.0;
//
//   //Duration
//   static const pixelRatio = 3.0;
//   static const delayCapture = 10;
//   static const clearCacheDuration = 2;
//
//   //version SDK
//   static const androidSdkIntForStoragePermission = 32;
//   static const qrCodeSizeRatio = 1.8;
//
//   //Bottom Sheet
//   static const heightBottomSheet = 0.7;
//
//   //mau enabled
//   static const fullColor = 1.0;
//   static const halfColor = 0.5;
//
//   //border width
//   static const borderWidth1 = 1.0;
//   static const borderWidth2 = 2.0;
//
//   //Slider
//   static const trackHeight = 2.0;
//   static const enabledThumbRadius = 6.0;
//   static const headerSignHeight = 6.0;
//
//   //checkbox
//   static const checkboxSize = 0.8;
//   static const animationCheckIconPosition = 0.6;
//
//   //Dialog
//   static const double minDialogWidth = 200.0;
//   static const double sizeLoadingIndicator = 35.0;
//
//   //timeDuration shimmer
//   static const int timeDurationShimmer = 700;
//   static const durationScrollController = 1000;
//
//   //Scroll fixed
//   static const scrollThumbLength = 20.0;
//   static const scrollThickness = 6.0;
//   static const scrollRadius = 10.0;
//
//   //other
// }
//
// extension GetSizeScreen on num {
//   /// Tỉ lệ fontSize của các textStyle
//   double get divSF {
//     return this / Get.textScaleFactor;
//   }
//
//   // Tăng chiều dài theo font size
//   double get mulSF {
//     return this * Get.textScaleFactor;
//   }
// }
