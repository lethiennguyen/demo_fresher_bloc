import 'package:flutter/material.dart';
// import 'package:get/get.dart';

import '../constants/app_const.dart';

// class AppLocale {
//   /// English.
//   static const Locale en = Locale('en', 'EN');
//
//   /// Vietnamese.
//   static const Locale vi = Locale('vi', 'VN');
//
//   static final hiveApp = Get.find<AppHive>();
//   static Future<void> updateLocale(Locale locale) async {
//     await Get.updateLocale(locale);
//     return hiveApp.put(AppConst.keyLocale, '$locale');
//   }
//
//   static Locale get defaultLocale {
//     // return vi;
//     final deviceLocale = vi;
//     Get.deviceLocale;
//     final internalLocale = hiveApp.get(
//       AppConst.keyLocale,
//     );
//     Get.deviceLocale;
//     // HiveApp().get(
//     //   AppConst.keyLocale,
//     //   defaultValue: '$deviceLocale',
//     // );
//     final resultLocals = supportLocales.singleWhere(
//       (locale) => internalLocale == '$locale',
//       orElse: () => deviceLocale,
//     );
//     return resultLocals;
//   }
//
//   static const List<Locale> supportLocales = [vi, en];
//
//   static const List<LocalizationsDelegate> localizationsDelegates = [
//     GlobalCupertinoLocalizations.delegate,
//     GlobalMaterialLocalizations.delegate,
//     GlobalWidgetsLocalizations.delegate,
//     DefaultCupertinoLocalizations.delegate
//   ];
// }
