import 'package:demo_fresher_bloc/feature/home/presentation/page/home_page.dart';
import 'package:demo_fresher_bloc/feature/login/domain/use_case/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/app/app_page.dart';
import '../../feature/app/bloc/app_bloc.dart';
import '../../feature/home/presentation/bloc/home_bloc.dart';
import '../../feature/login/presentation/bloc/controller.src.dart';
import '../../feature/login/presentation/page/login_page.dart';
import 'app_router.dart';
import 'package:get_it/get_it.dart';

class RouterPage {
  static final sl = GetIt.instance;
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouter.routerSplash:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AppBloc>(),
            child: SplashPage(),
          ),
        );

      case AppRouter.routerLogin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<LoginBloc>(),
            child: LoginPage(),
          ),
        );

      case AppRouter.routerHome:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<HomeBloc>(),
            child: HomePage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
