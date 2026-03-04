import 'package:flutter/material.dart';

import '../../core.src.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;

  void pop<T extends Object?>([T? result]) {
    navigatorKey.currentState?.pop(result);
  }

  Future<T?> pushNamed<T extends Object?>(String route, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed<T>(route, arguments: arguments);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String route, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil<T>(
      route,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  Future<void> showAppDialog({
    required String title,
    required String message,
    String confirmText = 'OK',
    VoidCallback? onConfirm,
    bool barrierDismissible = false,
  }) async {
    final ctx = context;
    if (ctx == null) return;

    await showDialog<void>(
      context: ctx,
      barrierDismissible: barrierDismissible,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx, rootNavigator: true).pop();
              onConfirm?.call();
            },
            child: Text(confirmText),
          ),
        ],
      ),
    );
  }

  Future<void> goToLoginAndClear() async {
    await pushNamedAndRemoveUntil(AppRouter.routerLogin);
  }
}
