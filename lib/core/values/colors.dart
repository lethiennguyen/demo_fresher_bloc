// import 'package:flutter/material.dart';
//
// class AppColors {
//   static const Color colorOrange = Color(0xFFEF4C2B);
//   static const Color colorBlack = Colors.black;
//   static const Color colorOrange2 = Color(0xFFF24E1E);
//   static const Color colorGray = Color(0xff707B81);
//   static const Color colorWhite = Color(0xffffffff);
//   static const Color colorWhiteGray = Color(0xffEBECED);
//   static const Color colorGray1 = Colors.grey;
//   static const Color colorGray2 = Color(0xff6B6B6B);
//   static const Color colorGray3 = Color(0xff242E37);
//   static const Color colorRed = Colors.red;
//   static const Color informationCart = Color(0xffCF001C);
//   static const Color colorGreen = Colors.green;
//   static const Color basicGrey4 = Color(0xFFF4F4F4);
//   static const Color basicWhite = Color(0xFFFFFFFF);
//   static const Color basicWhiteBanner = Colors.white;
//   static const Color basicGrey3 = Color(0xFFDBDBDB);
//   static const Color basicGrey5 = Color(0xFFF9FAFB);
//   static const Color basicGrey2 = Color(0xFFA9A9A9);
//   static const Color basicGrey1 = Color(0xFF7E7E7E);
//   static const Color basicGrey40 = Color(0x66A9A9A9);
//   static const Color basicGreyPin = Color(0x66E9EBEE);
//   static const Color basicGreyHeader = Color(0xFF79747E);
//   static Color bgDisable() => const Color(0xFFf2f6f9);
//   static Color bgInviable() => Colors.black.withAlpha((0.8 * 255).round());
//
//   static const Color primaryColor = Color(0xFFEE0033);
//   static const Color secondaryColor = Color(0xff1379F0);
//   static const Color primaryNavy = Color(0xFF1C1E66);
//   static const Color basicBlack = Color(0xFF333333);
//   static const Color primaryCam1 = Color(0xFFFD5C00);
//
//   ///background, border snackBar
//   static const Color backgroundSuccess = Color(0xFFECFBF1);
//   static const Color backgroundFail = Color(0xFFFEEEEC);
//   static const Color backgroundInfo = Color(0xFF44494D);
//   static const Color backgroundWarning = Color(0xFFFFF4D8);
//   static const Color backgroundNotification = Color(0xFFE9F3FF);
//
//   static const List<Color> primaryMain = [
//     Color(0xFFFD5C00),
//     Color(0xFFD40E19),
//   ];
//
//   static const List<Color> colorHeadPayroll = [
//     Color(0xffF6921E),
//     Color(0xffF15922),
//   ];
//
//   static const Color statusGreen = Color(0xFF379000);
//   static const Color statusRed = Color(0xFFFE0000);
//   static const Color statusYellow = Color(0xFFFFC700);
//   static const Color statusNoti = Color(0xFF2A83EA);
//
//   static const Color secondaryNavyPastel = Color(0xFFF1F3FF);
//   static const Color secondaryCamPastel2 = Color(0xFFFFF3EC);
//   static const Color secondaryCamPastel = Color(0xFFFFEADE);
//   static const Color secondaryOrange3 = Color(0xFFCA4A00);
//   static const Color secondaryOrange2 = Color(0xFFE45300);
//   static const Color secondaryOrange1 = Color(0xFFFD5C00);
//
//   static const Color colorTransparent = Colors.transparent;
//   static const Color colorBlack333333 = Color(0xFF333333);
//   static const Color colorBlack38 = Colors.black38;
//   static Color colorGreyOpacity35 = Colors.black.withValues(alpha: 0.8);
//   static const Color colorDisable = Color(0xFF9d9d9d);
//
//   static const Color dsGray1 = Color(0xFF16243D);
//   static const Color dsGray2 = Color(0xFF58647A);
//   static const Color dsGray3 = Color(0xFF9BA3B1);
//   static const Color dsGray4 = Color(0xFFD5D8DD);
//   static const Color dsGray5 = Color(0xFFDBDBDB);
//   static const Color dsGray6 = Color(0xFFE5E5E5);
//   static const Color dsGray7 = Color(0xFFF2F2F2);
//
//   static const Color greyDark = Color(0xFF16243D);
//   static const Color greyLight = Color(0xFFDBDBDB);
//
//   static const Color buttonTab = Color(0xFFFFF3EC);
//   static const Color trackColorSwitch = Color(0xFFA9A9A9);
//   static const Color thumbColorSwitch = Color(0xFF7E7E7E);
//
//   static const Color backgroundColorLight = Color(0xFFF7F8FA);
//
//   static const Color mainColors = Color(0xFFff5500);
//
//   static const Color backgroundButton = Color.fromARGB(255, 251, 206, 214);
//
//   static const Color lighterPrimaryColor = Color(0xFFFDE8EA);
//   static const Color textColorGrey = Color(0xFF737373);
//   static const Color colorBorder = Color(0xFFBCC1CA);
//   static const Color colorIconSuccess = Color(0xFF34C759);
//   static const Color dividerColor = Color(0xFFF5F5F5);
//   static const Color primaryColorDisable = Color(0xFFE48595);
//
//   static const LinearGradient gradientGray = LinearGradient(
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//     colors: [
//       Color(0xFFFFCCD7),
//       basicWhite,
//     ],
//     stops: [
//       0,
//       0.85,
//     ],
//   );
//   //Hàm để trong baseTheme phải truyền giá trị vào để phân biệt giao diện
//   static Color accentColorTheme(bool isDark) =>
//       isDark ? darkAccentColor : lightAccentColor;
//
//   // Những biến sử dụng trong app phải đảm bảo màu cho 2 giao diện sáng/tối
//   static bool _isDarkMode() => false;
//   static Color textColor() => _isDarkMode() ? Colors.white : Colors.black;
//   static Color textHomeColor() =>
//       _isDarkMode() ? Colors.white : darkAccentColor;
//   static Color errorText() => _isDarkMode() ? errorTextColor : Colors.redAccent;
//   static Color errorTextHistory() =>
//       _isDarkMode() ? errorTextColor : Colors.redAccent;
//   static Color selectedInvoice() =>
//       _isDarkMode() ? blueIconColor : orangeSelected;
//   static Color? selectedInvoicePressed() =>
//       _isDarkMode() ? null : orangeSelected;
//
//   static Color leftBarChart() =>
//       _isDarkMode() ? Colors.white30 : darkAccentColor;
//   static Color titleDataBarChart() =>
//       _isDarkMode() ? Colors.white30 : bgKeyBoardbtn;
//   static Color textReColor() => _isDarkMode() ? Colors.black : Colors.white;
//   static Color hintTextColor() =>
//       _isDarkMode() ? Colors.white54 : Colors.black54;
//   static Color dialogInvExtend() =>
//       _isDarkMode() ? darkAccentColor : Colors.white;
//   static Color appBarColor() =>
//       _isDarkMode() ? darkAccentColor : lightAccentColor;
//   static Color keyBoardColor() =>
//       _isDarkMode() ? darkAccentColor : const Color(0xFFff7e5f);
//   static Color splashColor() =>
//       _isDarkMode() ? darkAccentColor : lightAccentColor;
//   static Color subTextColor() =>
//       _isDarkMode() ? Colors.white54 : Colors.black87;
//   static Color statusBarColor() =>
//       _isDarkMode() ? darkAccentColor : colorBackgroundLight;
//   static Color dateTimeColor() =>
//       _isDarkMode() ? darkPrimaryColor : const Color(0xFFf7f7f7);
//   static Color cardBackgroundColor() =>
//       _isDarkMode() ? darkPrimaryColor : Colors.white;
//   static Color linkText() => _isDarkMode() ? colorBlueAccent : orange;
//   static Color invoiceStickyHead() => _isDarkMode() ? colorBlueB1FF : orange;
//   static Color cardBackgroundOrange() =>
//       _isDarkMode() ? backgroundColor : const Color(0xffFF772E);
//   static Color cardBorderColor() =>
//       _isDarkMode() ? darkAccentColor : Colors.white70;
//   static Color cardColors() => _isDarkMode() ? cardColor : Colors.white;
//   static Color iconHomeSelectColor() =>
//       _isDarkMode() ? Colors.white : darkAccentColor;
//   static Color backgroundHomeColor() =>
//       _isDarkMode() ? darkAccentColor : Colors.white;
//   static Color slideActionColor() =>
//       _isDarkMode() ? darkAccentColor : bgSlideColorLight;
//   static Color iconHomeColor() => _isDarkMode() ? Colors.white54 : Colors.grey;
//   static Color inputText() =>
//       _isDarkMode() ? darkPrimaryColor : lightAccentColor;
//   static Color inputTextBottomSheet() =>
//       _isDarkMode() ? darkPrimaryColor : const Color(0xffefefef);
//   static Color inputQuickInvoice() =>
//       _isDarkMode() ? darkAccentColor : const Color(0xffefefef);
//   static Color inputInvExtra() =>
//       _isDarkMode() ? darkAccentColor : lightAccentColor;
//   static Color inputTextWhite() =>
//       _isDarkMode() ? darkPrimaryColor : Colors.white;
//   static Color bgInputText() =>
//       _isDarkMode() ? bgInputTextColor : lightAccentColor;
//   static Color bottomSheet() => _isDarkMode() ? buttonColor : Colors.white;
//   static Color chipColorTheme() =>
//       _isDarkMode() ? backgroundColor : orangeShade;
//   static Color iconEmpty() => _isDarkMode() ? Colors.white30 : orangeShade;
//   static Color appBarInvoice() => _isDarkMode() ? darkAccentColor : orange;
//   static Color selectedChip() => _isDarkMode() ? backgroundSearchColor : orange;
//   static Color titleBarChart() =>
//       _isDarkMode() ? Colors.white30 : darkAccentColor;
//   static Color barChart() => _isDarkMode() ? backgroundSearchColor : chipColor;
//   static Color stickyHead() =>
//       _isDarkMode() ? backgroundColor : lightAccentColor;
//   static Color dateTimeHistory() =>
//       _isDarkMode() ? backgroundColor : const Color(0x40f0eff2);
//   static Color invoiceStatusWait() =>
//       _isDarkMode() ? const Color(0x6688c6ed) : const Color(0xff088aec);
//   static Color invoiceStatusNewly() =>
//       _isDarkMode() ? const Color(0x6682c341) : const Color(0xff44aca0);
//   static Color invoiceStatusPublished() =>
//       _isDarkMode() ? const Color(0x66009f75) : const Color(0xff34a853);
//   static Color invoiceStatusTaxDeclared() =>
//       _isDarkMode() ? const Color(0x66394BA0) : const Color(0xff394BA0);
//   static Color invoiceStatusReplaced() =>
//       _isDarkMode() ? const Color(0x80EF4444) : const Color(0xffEF4444);
//   static Color invoiceStatusHandle() =>
//       _isDarkMode() ? Colors.purple.shade300 : const Color(0xFFfd754a);
//   static Color invoiceStatusCanceled() =>
//       _isDarkMode() ? const Color(0x80EF4444) : const Color(0xffe73526);
//   static Color invoiceStatusApproved() =>
//       _isDarkMode() ? const Color(0xffD54799) : const Color(0xff690fbb);
//   static Color invoiceList() => _isDarkMode() ? bgInputTextColor : Colors.white;
//   static Color textSearchInvProfile() =>
//       _isDarkMode() ? Colors.white : Colors.indigo.shade700;
//   static Color borderColor() => _isDarkMode() ? darkAccentColor : Colors.white;
//   static Color statusBarInvoice() => _isDarkMode() ? darkAccentColor : orange;
//
//   static Color selectedProduct() =>
//       _isDarkMode() ? blueIconColor : const Color(0x77f88754);
//   static Color spinboxColor() => _isDarkMode() ? Colors.white : chipColor;
//   static Color invoiceListOver() =>
//       _isDarkMode() ? Colors.redAccent : Colors.white;
//   static Color borderCard() =>
//       _isDarkMode() ? Colors.transparent : prefixIconColor;
//   static Color noSerialCert() =>
//       _isDarkMode() ? chipColor : const Color(0xff1390e5);
//   static Color filterTextTabbar() =>
//       _isDarkMode() ? Colors.white : colorBlueAccent;
//   static Color backgroundTabbarColor() =>
//       _isDarkMode() ? darkAccentColor : orange;
//   static Color colorInputText() =>
//       _isDarkMode() ? const Color(0xff333333) : const Color(0xff333333);
//
//   static List<Color> searchInvoice() =>
//       _isDarkMode() ? colorGradientOrange : colorGradientWhite;
//   static List<Color> barChartEmpty() =>
//       _isDarkMode() ? colorGradientGrey : colorGradientGrey;
//   static List<Color> barChartData() =>
//       _isDarkMode() ? colorGradientBlue : colorGradientIconHome;
//   static List<Color> barReChartData() =>
//       _isDarkMode() ? colorGradientIconHome : colorGradientBlue;
//   static List<Color> removeFilter() =>
//       _isDarkMode() ? colorGradientGray : colorGradientGrey;
//   // for Light Theme
//   static const lightPrimaryColor = Color(0xFFeff6ff);
//   static const lightAccentColor = Color(0xFFf0eff2);
//   static const stickyHeadLight = Color(0xFFffffff);
//
//   // for Light Theme
//   static const darkPrimaryColor = Color(0xFF3e4161);
//   static const darkAccentColor = Color(0xFF25273f);
//
//   static const Color colorLoading = Color(0xFF58a0ff);
//   static const Color colorBackgroundLight = Color(0xFFf7f7f7);
//   static const Color chipDisable = Color(0xFFefefef);
//   static const Color orange = Color(0xFFe2530c);
//   static const Color orangeShade = Color(0xFFfee0d6);
//   static const lightSecondColor = Color(0xFFeb5624);
//   static const Color highlightColor = Colors.blue;
//   static const Color redDark = Color(0xFFD32F2F);
//   static const Color colorF99132 = Color(0xFFF99132);
//   static Color orangeHighlight = const Color(0xffF6844E).withValues(alpha: 0.2);
//
//   // static const Color textColor = Colors.white;rgb(242, 242, 242)
//
//   static const Color colorButtonDenied = Color.fromRGBO(242, 242, 242, 1);
//   static const Color fillColor = Colors.white70;
//   static const Color backgroundSearchColor = Color(0xFF596AFE);
//   static const Color bgSlideColorLight = Color(0xFFf9f9f9);
//   static const Color errorTextLogin = Colors.white;
//   static const Color cardColor = Color(0xFF414465);
//   static const Color systemIconColor = Color(0xFF77EDFE);
//   static const Color calendarIconColor = Color(0xFF464E88);
//   static const Color calendarIconColord = Color(0xFF281F1C);
//   static const Color blueIconColor = Color(0xFF3b3e66);
//   static const Color appBarColor1 = Color(0xFF333754);
//   static const Color buttonColor = Color(0xFF25273f);
//   static const Color buttonColor2 = Color(0x0ff3ffff);
//   static const Color backgroundColor = Color(0xFF333753);
//   static const Color bgInputTextColor = Color(0xFF3e4161);
//   static const Color bgHighLight = Color(0x60FFFFFF);
//   static const Color bgKeyBoard = Color(0xFF1f212d);
//   static const Color bgKeyBoardbtn = Color(0xFF65686f);
//   static const Color errorTextColor = Color(0xFFFFD54F);
//   static const Color textColorWhite = Colors.white;
//   static const Color backgroundColorWhite = Colors.white;
//   static const Color colorText = Color(0xFF172D58);
//   static const Color grey = Colors.grey;
//   static const Color greyF0EFF4 = Color(0xFFF0EFF4);
//   static const Color grey2 = Color(0xFFD9D9D9);
//   static const Color green = Color(0xFF269DB7);
//   static const Color blue = Color(0xFF92C6F9);
//   static const Color green4DD02C = Color(0xFF4DD02C);
//   static const Color green119626 = Color(0xFF119626);
//   static const Color green1BAC67 = Color(0xFF1BAC67);
//   static const Color chipColor89132 = Color(0xFFF89132);
//   static const Color colorBlueLightAccent = Color(0xFF5EDDF6);
//   static const Color colorYellow = Color(0xFFF6C000);
//   static const Color color266AEF = Color(0xFF266AEF);
//   static const Color color828C94 = Color(0xFF828C94);
//   static const Color colorNavigator = Color(0xFF9BA3B1);
//
//   // static const Color hintTextColor = Colors.white30;
//   static const Color hintTextSolidColor = Color(0xCCFFFFFF);
//   static final Color prefixIconColor = Colors.grey.shade500;
//   static const Color prefixIconLogin = Colors.white;
//   static const Color greyItemColor = Color(0xFFF3F4F6);
//   static const Color textColorDefault = Color(0xFF111111);
//   static const Color chipColor = Color(0xfff36f21);
//   static const Color colorBlue = Colors.blue;
//   static const Color colorBlue67ff = Color(0xFF5967ff);
//   static const Color colorBBB2B2 = Color(0xFFBBB2B2);
//   static const Color colorBlueAccent = Colors.blueAccent;
//   static const Color titleText = Colors.white54;
//   static const Color colorShowCaseIcon = Colors.white;
//   static const Color colorShowCaseText = Colors.white;
//   static const Color colorBackgroundShowCase = Colors.white30;
//   static const Color colorError = Color(0xFFff5f6d);
//   static const Color textColorIncrease = Color(0xFF06beb6);
//   static const Color textColorDecrease = Color(0xFFd66d75);
//   static const Color colorTextQRCodeName = Color(0xFF604A31);
//   static const Color colorInvoicesReplaced = Color(0xffecbb00);
//   static const Color orangeSelected = Color(0xFFff7e5f);
//   static const Color colorRecord = Color(0xFFf37304);
//   static const Color colorOrangeBtn = Color(0xFFE1613C);
//   static const Color colorUnRecord = Color(0xffeaeaea);
//   static const Color colorInvoicesAdjust = Color(0xFFff7e5f);
//   static const Color colorGreenLight = Color(0xFF82c341);
//   static const Color colorRed444 = Color(0xccEF4444);
//   static const Color colorBasic = Color(0xff9BA3B1);
//   static const Color colorBlueB1FF = Color(0xE682B1FF);
//   static const Color colorInvoicesReplace = Color(0xffffd751);
//   static const Color colorF4 = Color(0xfff4f4f4);
//   static Color? colorUnselectedLabel = Colors.grey[400];
//   static Color buttonBackgroundColor = Colors.deepOrange.shade400;
//   static Color buttonForegroundColor = Colors.white;
//   static const Color colorF5 = Color(0xffEBEBFF);
//   static const Color colorBoxDecorationList = Color.fromRGBO(244, 164, 96, 0.1);
//   static const Color titleColor = Colors.grey;
//   static const Color lineBar = Color(0xffEEE4DA);
//   static const Color numberDate = Color(0xffF4970A);
//   static const Color numberDate2 = Color.fromARGB(255, 22, 151, 237);
//   static const Color backgroundOption = Color(0xffF5F5F5);
//   static const Color backgroundSelect = Color(0xffc8e1fa);
//   static const Color backgroundGrey = Color.fromARGB(255, 235, 234, 238);
//   static const Color logoHRMColor = Color(0xFFff931d);
//   static const Color colorBlack26 = Color.fromARGB(66, 0, 0, 0);
//   static const Color colorBlack5 = Color(0x0D000000);
//
//   static const Color colorGreyDarker = Color.fromARGB(114, 0, 0, 0);
//   static const Color colorGrey2 = Color(0x059E9E9E);
//   static const Color colorPinkED6 = Color(0xFFFDAED6);
//
//   static const Color colorGreenX = Color(0xff1FB007);
//   static const Color colorGreenFainter = Color(0xff45C186);
//
//   static const Color colorOrangeButton = Color(0xFFFD7900);
//   static const Color colorQRButton = Color(0x45FD7900);
//   static const Color totalRegisterMeal = Color(0xFF13CF13);
//   static const Color indicatorTabBarColor = Colors.yellowAccent;
//
//   // contract
//   static const Color colorBackgroundContract = Color(0xffE93A3A);
//
//   // color pen
//   static const List<Color> colorPen = [
//     Color(0xFFDE3B40),
//     Color(0xFF1D2128),
//     Color(0xFF0F4C7B),
//   ];
//
//   static const List<Color> colorGradientOrange = [
//     Color(0xFFff7e5f),
//     Color(0xFFff5f6d),
//   ];
//
//   static const List<Color> colorGradientBlue = [
//     Color(0xFF58a0ff),
//     Color(0xFF5967ff),
//   ];
//   static const List<Color> colorGradientBlueLogin = [
//     Color(0xFF5967ff),
//     Color(0xFF5967ff),
//     // Color(0xFF596AFE),
//   ];
//   static const List<Color> colorGradientBlack = [
//     Colors.black,
//     Colors.black87,
//   ];
//   static const List<Color> colorGradientGrey = [
//     Color(0xFF9ca4bc),
//     Color(0xFF9ca4bc)
//   ];
//
//   static const List<Color> colorGradientGray = [
//     Color(0x20FFFFFF),
//     Color(0x20FFFFFF),
//   ];
//
//   static const List<List<Color>> colorGradientList = [
//     [Color(0xFFD4145A), Color(0xFFFBB03B)],
//     [Color(0xFF4568dc), Color(0xFFb06ab3)],
//     [Color(0xFF588be5), Color(0xFF3ac9dd)],
//   ];
//   static const List<Color> colorPieDashboard = [
//     Color(0xFF2697fe),
//     Color(0xffbf5efe),
//     Color(0xFF19eaaa),
//     Color(0xFFffcf27),
//     Color(0xFFff6057),
//   ];
//
//   static const List<Color> colorStatusHistoryTitle = [
//     Color(0xFF03A9F4),
//     Color(0xFFff6057),
//     Color(0xFF8DBD26),
//   ];
//
//   static const List<Color> colorGradientWhite = [
//     Colors.white,
//     Colors.white,
//   ];
//
//   static const List<Color> colorGradientIconHome = [
//     Color(0xFFfd754a),
//     Color(0xFFfd8058),
//   ];
//
//   // static const List<Color> colorHeadPayroll = [
//   //   Color(0xffF6921E),
//   //   Color(0xffF15922),
//   // ];
//
//   static const List<Color> listColorAvatars = [
//     green119626,
//     colorGreen,
//     colorBlueAccent,
//     mainColors,
//     grey,
//     Color(0xFFC7732A),
//     Color(0xFFFBB91A),
//     Color(0xffbf5efe),
//   ];
//
//   // static Map<String, Color> mapColorBackgroundSnackBar = {
//   //   AppConst.actionSuccess: AppColors.backgroundSuccess,
//   //   AppConst.actionFail: AppColors.backgroundFail,
//   //   AppConst.actionWarning: AppColors.backgroundWarning,
//   //   AppConst.actionNotification: AppColors.colorWhite,
//   // };
//
//   // static Map<String, Color> mapColorBorderSnackBar = {
//   //   AppConst.actionSuccess: AppColors.statusGreen,
//   //   AppConst.actionFail: AppColors.statusRed,
//   //   AppConst.actionWarning: AppColors.statusYellow,
//   //   AppConst.actionNotification: AppColors.colorWhite,
//   // };
//   // static Map<String, String> mapIconSnackBar = {
//   //   AppConst.actionSuccess:
//   //       Assets.ASSETS_IMAGES_APP_ICON_ICON_SNACK_BAR_SUCCESS_SVG,
//   //   AppConst.actionFail: Assets.ASSETS_IMAGES_APP_ICON_ICON_SNACK_BAR_FAIL_SVG,
//   //   AppConst.actionWarning:
//   //       Assets.ASSETS_IMAGES_APP_ICON_ICON_SNACK_BAR_WARNING_SVG,
//   //   AppConst.actionNotification:
//   //       Assets.ASSETS_IMAGES_APP_ICON_ICON_SNACK_BAR_NOTIFICATION_SVG,
//   // };
//   //shimmer
//   static const Color baseShimmerColor = Color(0xFFE9EBF1);
//   static const Color highlightShimmerColor = Color(0xFFF7F8FA);
//
//   //Scrollbar
//   static const Color scrollBarTrackColor = Color(0xFFF1F1F1);
//   static const Color scrollBarThumbColor = Color(0xFFBDBDBD);
//
//   //Task manage
//   static const Color inProgressColor = Color(0xFF1579D6);
//   static const Color completedOnTimeColor = Color(0xFF128D1F);
//   static const Color overdueColor = Color(0xFFEC221F);
//   static const Color toDoColor = Color(0xff989A9E);
//   // task manager
//   static const Color redHighlight = Color(0xFFFFE0DF);
//   static const Color blueHighlight = Color(0xFFDBE5FE);
//   static const Color greenHighlight = Color(0xFFCCFCEE);
//   static const Color redTextHighlight = Color(0xFFCC554F);
//   static const Color blueTextHighlight = Color(0xFF5477AE);
//   static const Color greenTextHighlight = Color(0xFF42AF8F);
//   static const Color redHighlightBackground = Color(0xFFFFF0EF);
//
//   // list task
//   static const Color redTextHigh = Color(0xFFE74C3C);
//   static const Color redBackgroundHigh = Color(0xFFFFEAEA);
//   static const Color orangeTextMedium = Color(0xFFF6A712);
//   static const Color orangeBackgroundMedium = Color(0xFFFFF8E1);
//   static const Color greenTextLow = Color(0xFF4BAE63);
//   static const Color greenBackgroundLow = Color(0xFFE8F5E9);
//   static const Color textColorTaskList = Color(0xff475569);
//   static const Color listTaskIconGrey = Color(0xff989A9E);
//   static const Color listTaskIconGrey2 = Color(0xffF1F5F9);
//   static const Color listTaskBtn = Color(0xff2363EA);
//
//   // bottom navigation bar
//   static const Color colorBottomNavigationBaR = Color(0xFF36A4F8);
//   // Box shadow app
//   static Color colorBlack50 = const Color(0xff000000).withValues(alpha: 0.5);
//   static Color colorBlack005 = const Color(0xff000000).withValues(alpha: 0.05);
//   // Chart
//
//   //Column Chart
//   static const Color columnChartColor = Color(0xFF146083);
//   //button colors
//   static const Color btnRedColor = Color(0xFFFFEAEA);
//   static const Color textBtnRedColor = Color(0xFFDB4C4D);
//   static const Color btnBlueColor = Color(0xFFDBE5FE);
//   static const Color textBtnBlueColor = Color(0xff2363EA);
//   //Base Card
//   static const Color boxShadowColor = Color(0x40000000);
//   static const Color overDueBaseCard = Color(0xFFFFF5F5);
//
//   // progress colors
//   static const Color colorProgress = Color(0xFFD2D2D2);
//
//   //notification
//   static const Color notificationColorBlue = Color(0xFFE8F0FE);
//   static const Color notificationTextColorBlue = Color(0xFF2096EF);
//
//   static const Color notificationColorGreen = Color(0xFFE6F4EA);
//   static const Color notificationTextColorGreen = Color(0xFF1E8E3E);
//
//   static const Color notificationColorOrange = Color(0xFFFEF7E0);
//   static const Color notificationTextColorOrange = Color(0xFFF9AB4D);
//
//   static const Color notificationColorRed = Color(0xFFFCE8E6);
//   static const Color notificationTextColorRed = Color(0xFFE03B25);
//
//   static const Color notificationColorPurple = Color(0xFFF3E8FD);
//   static const Color notificationTextColorPurple = Color(0xFF9334E6);
//
//   static const Color textColorGreyNoti = Color(0xFF666666);
// }
