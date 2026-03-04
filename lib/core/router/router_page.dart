import 'package:demo_fresher_bloc/feature/detail/presentation/bloc/controller.src.dart';
import 'package:demo_fresher_bloc/feature/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../feature/app/app_page.dart';
import '../../feature/app/bloc/app_bloc.dart';
import '../../feature/detail/presentation/page/detail_product_page.dart';
import '../../feature/home/domain/domain.src.dart';
import '../../feature/home/presentation/bloc/home_bloc.dart';
import '../../feature/login/presentation/bloc/controller.src.dart';
import '../../feature/login/presentation/page/login_page.dart';
import 'app_router.dart';

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
      case AppRouter.routerDetail:
        final args = settings.arguments;

        final ProductEntity? entity = (args is ProductEntity) ? args : null;

        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<DetailProductBloc>(param1: entity),
            child: const DetailProductPage(),
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
