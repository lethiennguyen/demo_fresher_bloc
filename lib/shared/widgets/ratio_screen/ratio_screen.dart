import 'package:flutter/cupertino.dart';

import '../../../lib.dart';

extension GetSizeDesignScreen on num {
  /// Tỉ lệ chiều ngang(width) của màn hình hiện tại so với màn hình thiết kế
  double w(BuildContext context) {
    return AppDimens.ratioWidth(context) * toInt();
  }

  /// Tỉ lệ chiều cao(height)
  double h(BuildContext context) {
    return AppDimens.ratioHeight(context) * toInt();
  }

  /// Tỉ lệ fontSize của các textStyle
// double get sp {
//   return this * scaleFontsize;
// }
}
