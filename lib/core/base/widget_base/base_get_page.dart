import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core.src.dart';
import 'get_page_mixin.dart';

abstract class BaseGetPage<T extends BaseBloc> extends StatefulWidget
    with BlocPageMixin<T> {
  const BaseGetPage({super.key});

  /// Mặc định lấy bloc từ GetIt (sl)
  T createBloc(BuildContext context) => sl<T>();

  /// Hook để page làm gì đó khi init (vd: add event AppStarted)
  void onInit(BuildContext context, T bloc) {}

  @override
  State<BaseGetPage<T>> createState() => _BaseGetPageState<T>();
}

class _BaseGetPageState<T extends BaseBloc> extends State<BaseGetPage<T>> {
  late final T bloc = widget.createBloc(context);

  @override
  void initState() {
    super.initState();
    // đảm bảo context đã ok để add event
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInit(context, bloc);
    });
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>.value(
      value: bloc,
      child: widget.build(context), // ✅ build của mixin để overlay chạy
    );
  }
}
