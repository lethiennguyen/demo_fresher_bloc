/// class chứa các giá trị không đổi quan trọng trong dự án
class AppConst {
  static const int currencyUtilsMaxLength = 12;
  static const int maxLengthDefault = 250;
  static const double offsetTakeImageX = 0.0;

  static const int pageIndex = 1;
  static const int pageSize = 10;

  //error
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error403 = 403;
  static const int error502 = 502;
  static const int error503 = 503;
  static const int error400 = 400;

  //success
  static const String codeResultSuccess = "00";

  static const Duration requestTimeOut = Duration(milliseconds: 15000);
  // static const int requestTimeOut = 15000;

  ///action snackbar
  static const String actionSuccess = "actionSuccess";
  static const String actionFail = "actionFail";
  static const String actionNotification = "actionNotification";
  static const String actionWarning = "actionWarning";

  ///language code
  static const String keyLocale = "keyLocale";
  static const String countryCodeVN = "VN";
  static const String countryCodeEN = "EN";
  static const String languageCodeVN = "vi";
  static const String languageCodeEN = "en";
  static const String countryCode = "countryCode";

  /// fake notification
  static const String userNameFake = "aaaaaaa";

  /// fake count data suggestion page
  static const int fakeTitleSuggesionCount = 30;

  static const int lengthTabBar = 4;

  static const String shareMethodChannel = "com.example.share/share";

  ///cons type url ,1 là test 2 là pro ,3 l uat
  static const int typeUrlTest = 1;
  static const int typeUrlUat = 3;
  static const int typeUrlPro = 2;
  static const int typeUrlOther = 4;

  static const int pageIndex1 = 1;

  /// màn nhắc việc
  // Notification Recipient Types
  static const int recipientAll = 0;
  static const int recipientCreator = 1;
  static const int recipientPerformer = 2;
  static const int recipientParticipant = 3;

  // Periodic Reminder Types
  static const int periodicByDay = 1;
  static const int periodicByWeek = 2;
  static const int periodicByMonth = 3;

  // Reminder Day (Sunday to Saturday)
  static const int daySunday = 0;
  static const int dayMonday = 1;
  static const int dayTuesday = 2;
  static const int dayWednesday = 3;
  static const int dayThursday = 4;
  static const int dayFriday = 5;
  static const int daySaturday = 6;

  // Reminder Time (Minutes)
  static const int noneHour = 0;
  static const int before1Hour = 60;
  static const int before2Hours = 120;
  static const int before6Hours = 360;
  static const int before1Day = 1440;
  static const int before2Days = 2880;

  // read notification
  static const int readNotification = 1;
  static const int unreadNotification = 2;
  static const int allNotification = 0;

  // // Dữ liệu pie chart
  // static final List<ChartData> pieDataFake = [
  //   ChartData(
  //       x: 'Đang thực hiện ',
  //       y: 30,
  //      color:  AppColors.pieChartColors[PieChartTaskStatus.inProgress]!),
  //   ChartData(x: 'Hoàn thành',y:  30,
  //       color:  AppColors.pieChartColors[PieChartTaskStatus.completedOnTime]!),
  //   ChartData(
  //     x: 'Quá hạn',
  //     y: 40,
  //    color:  AppColors.pieChartColors[PieChartTaskStatus.overdue]!,
  //   ),
  // ];
  static const String textConst = "Dung de shimmer";

  static const String hotlineContactNumber = "19003396";
}
