import 'dart:convert';

import '../../../lib.dart';
import '../../values/const.dart';

BaseRequestListModel productRequestFromJson(String str) =>
    BaseRequestListModel.fromJson(json.decode(str));

String productRequestToJson(BaseRequestListModel data) =>
    json.encode(data.toJson());

class BaseRequestListModel {
  int page;
  int pageSize = AppConst.pageSize;

  BaseRequestListModel({required this.page, this.pageSize = AppConst.pageSize});

  factory BaseRequestListModel.fromJson(Map<String, dynamic> json) {
    return BaseRequestListModel(
      page: json['page'],
      pageSize: json['size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'page': page, 'size': pageSize};
  }
}
