import 'dart:io';

import 'package:demo_fresher_bloc/shared/widgets/show_popup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import '../../../shared/constants/const.src.dart';
import '../../../shared/exceptions/remote/remote_exception.dart';
import '../../core.src.dart';
import '../../router/app_router.dart';
import '../../values/app_string.dart';
import '../../values/key.dart';
import '../base_reponse/server_error.dart';
import 'navigation_service.dart';

class EnumRequestMethod {
  ///các type request API
  static const String POST = "POST";

  static const String GET = "GET";

  static const String DELETE = "DELETE";

  static const String PUT = "PUT";
}

class BaseApi {
  static final BaseApi _singleton = BaseApi._();

  factory BaseApi() => _singleton;

  BaseApi._();

  static Dio dio = getBaseDio();

  static Dio getBaseDio() {
    Dio dio = Dio();

    dio.options = buildDefaultOptions();

    return dio;
  }

  static BaseOptions buildDefaultOptions() {
    return BaseOptions()
      ..connectTimeout = AppConst.requestTimeOut
      ..receiveTimeout = AppConst.requestTimeOut;
  }

  static void close() {
    dio.close(force: true);
    updateCurrentDio();
  }

  static void updateCurrentDio() {
    dio = getBaseDio();
  }

  static Dio getCurrentDio() {
    return dio;
  }

  void setOnErrorListener(Function(Object error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  late Function(Object error) onErrorCallBack;

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> sendRequest(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool isToken =
        true, // mặc định request nào cũng cần token, login thì set false
    bool isHaveVersion = true,
    bool getHeader = false,
    Duration? timeOut,
    CancelToken? cancelToken,
    // Map<String, String>? headerAdds,
  }) async {
    dio.options = dioOptions ?? buildDefaultOptions();

    final Response response;

    final String url = urlOther ?? (ApiUrl.baseUrl + action);

    final Map<String, String> headers = headersUrlOther ??
        (isToken ? await getBaseHeader() : <String, String>{});
    final Options options = isDownload
        ? Options(
            headers: headers,
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            })
        : Options(
            headers: headers,
            method: requestMethod.toString(),
            responseType: ResponseType.json,
          );

    try {
      if (requestMethod == EnumRequestMethod.POST) {
        if (isQueryParametersPost) {
          response = await dio.post(
            url,
            queryParameters: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        } else {
          response = await dio.post(
            url,
            data: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        }
      } else if (requestMethod == EnumRequestMethod.DELETE) {
        response = await dio.delete(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (requestMethod == EnumRequestMethod.PUT) {
        if (isQueryParametersPost) {
          response = await dio.put(
            url,
            queryParameters: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        } else {
          response = await dio.put(
            url,
            data: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        }
      } else {
        response = await dio.get(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      }
      if (response.data is Map<String, dynamic>) {
        final Map<String, dynamic> body = response.data;

        if (body['status_code'] == 401) {
          await _handleUnauthorized();
        }
      }

      if (getHeader) {
        return response.headers.map;
      } else {
        return response;
      }
    } catch (e) {
      final remoteException = _buildDioException(e);

      // Nếu HTTP 401 thật
      if (e is DioException && e.response?.statusCode == 401) {
        if (functionError != null) {
          functionError(remoteException);
        } else {
          await _handleUnauthorized();
        }
      }

      throw remoteException;
    }
  }

  static bool _isRedirecting = false;

  static Future<void> _handleUnauthorized() async {
    if (_isRedirecting) return;
    _isRedirecting = true;

    final box = Hive.box(HiveBoxNames.auth);
    await box.clear();

    Future.delayed(const Duration(milliseconds: 300), () {
      _isRedirecting = false;
    });

    final nav = sl<NavigationService>();

    await nav.showAppDialog(
      title: LocaleKeys.notification_title,
      message: LocaleKeys.app_error401,
      confirmText: LocaleKeys.button_confirm,
      onConfirm: () {
        nav.goToLoginAndClear();
      },
    );
  }

  RemoteException _buildDioException(Object? exception) {
    if (exception is RemoteException) {
      return exception;
    }

    if (exception is DioException) {
      switch (exception.type) {
        case DioExceptionType.cancel:
          return RemoteException(
            kind: RemoteExceptionKind.cancellation,
            rootException: exception,
          );
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return RemoteException(
            kind: RemoteExceptionKind.timeout,
            rootException: exception,
          );
        case DioExceptionType.badResponse:
          final httpErrorCode = exception.response?.statusCode ?? -1;

          /// server-defined error
          if (exception.response?.data is Map<String, dynamic>) {
            final serverError = ServerError.fromJson(
                exception.response?.data as Map<String, dynamic>);

            return RemoteException(
              kind: RemoteExceptionKind.serverDefined,
              httpErrorCode: httpErrorCode,
              serverError: serverError,
              rootException: exception,
            );
          }

          return RemoteException(
            kind: RemoteExceptionKind.serverUndefined,
            httpErrorCode: httpErrorCode,
            rootException: exception,
          );
        case DioExceptionType.badCertificate:
          return RemoteException(
            kind: RemoteExceptionKind.badCertificate,
            rootException: exception,
          );
        case DioExceptionType.connectionError:
          return RemoteException(
            kind: RemoteExceptionKind.network,
            rootException: exception,
          );
        case DioExceptionType.unknown:
          if (exception.error is SocketException) {
            return RemoteException(
              kind: RemoteExceptionKind.network,
              rootException: exception,
            );
          }

          if (exception.error is RemoteException) {
            return exception.error as RemoteException;
          }
      }
    }

    return RemoteException(
      kind: RemoteExceptionKind.unknown,
      rootException: exception,
    );
  }

  Future<Map<String, String>> getBaseHeader() async {
    //final String token = HIVE_APP.get(AppKey.keyToken, defaultValue: '');
    final authBox = await Hive.openBox(HiveBoxNames.auth);
    final String token = authBox.get(HiveKeys.token, defaultValue: '');
    if (token.isNotEmpty) {
      return {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
    }

    return {
      "Content-Type": "application/json",
    };
  }
}
