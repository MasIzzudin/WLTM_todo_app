import 'dart:async';

import 'package:dio/dio.dart';

import '../../app/widgets/widgets.dart';

class AppInterceptor extends Interceptor {
  AppInterceptor();
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // TODO: implement onRequest

    return super.onRequest(options, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    DioException? error = err;
    if (error.response == null || error.response!.data == null) {
      error = DioException(
          requestOptions: RequestOptions(path: ""),
          response: Response(requestOptions: RequestOptions(path: ""), data: {
            "error": {"code": 403, "message": "Terjadi Kesalahan"}
          }));
    }

    Snackbar.warning(error.response!.data!.toString()); 

    return super.onError(err, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }
}
