import 'dart:convert';
import 'dart:io';

import 'package:demo_fresher_bloc/core/core.src.dart';
import 'package:demo_fresher_bloc/feature/app/di.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/base/base_repository_clean/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await moduleDIApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: sl<NavigationService>().navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: GoogleFonts.nunitoSans(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: const Color(0xff5C6771),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: CircleBorder(),
          backgroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterPage.generate,
      initialRoute: AppRouter.routerSplash,
    );
  }
}
