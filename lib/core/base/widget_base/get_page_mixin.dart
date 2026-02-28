import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.src.dart';

mixin BlocPageMixin<T extends BaseBloc> on StatefulWidget {
  //late final T bloc = sl<T>();

  bool get isAppWidget => false;

  bool get hasAppBar => true;

  double get toolbarHeight => kToolbarHeight;

  Widget buildPage(BuildContext context);

  Widget build(BuildContext context) {
    final screenPadding = MediaQuery.paddingOf(context);
    final appBarHeight = screenPadding.top + toolbarHeight;

    return isAppWidget
        ? buildPage(context)
        : Stack(
            children: [
              buildPage(context),

              /// Loading Overlay
              BlocBuilder<T, BaseState>(
                builder: (context, state) {
                  if (!state.isOverlayLoading) {
                    return const SizedBox.shrink();
                  }

                  return Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            top: hasAppBar ? appBarHeight : 0,
                          ),
                          color: Colors.transparent,
                        ),
                      ),
                      IgnorePointer(
                        ignoring: true,
                        child: Container(
                          color: Colors.black38,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
  }

  Widget baseShowLoading(Widget child) {
    return BlocBuilder<T, BaseState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return child;
      },
    );
  }
}
