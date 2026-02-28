import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'base_api.dart';

class BaseRepositoryBL {
  late final _cancelTokens = <CancelToken>[];

  Future<dynamic> baseCallApi(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    BaseOptions? dioOptions,
    bool isHaveVersion = true,
    bool isToken = true,
    Function(Object error)? functionError,
    Duration? timeOut,
    bool getHeader = false,
    Map<String, String>? headerAdds,
  }) {
    // Tạo một CancelToken mới cho mỗi request
    final cancelTokenRequest = CancelToken();
    _cancelTokens.add(cancelTokenRequest);
    return BaseApi().sendRequest(
      action, requestMethod,
      jsonMap: jsonMap,
      isDownload: isDownload,
      urlOther: urlOther,
      headersUrlOther: headersUrlOther,
      isQueryParametersPost: isQueryParametersPost,
      cancelToken: cancelTokenRequest,
      dioOptions: dioOptions,
      functionError: functionError,
      isHaveVersion: isHaveVersion,
      isToken: isToken,
      timeOut: timeOut,
      getHeader: getHeader,
      //headerAdds: headerAdds
    );
  }

  Future<void> close() async {
    // Hủy tất cả các CancelToken khi đóng
    for (final cancelToken in _cancelTokens) {
      if (!cancelToken.isCancelled) {
        cancelToken.cancel();
      }
    }
    _cancelTokens.clear();
  }
}
