import 'dart:convert';

import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler requestInterceptorHandler) async {
    // TODO: implement onRequest
    print(
        "--> ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl.isNotEmpty ? options.baseUrl : ""}${options.path.isNotEmpty ? options.path : ""}"}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters.isNotEmpty) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      if(options.data is FormData) {
        print("Body: ${options.data}");
      } else {
        print("Body: ${jsonEncode(options.data)}");
      }
    }
    print(
        "--> END ${options.method.isNotEmpty ? options.method.toUpperCase() : 'METHOD'}");
    return super.onRequest(options, requestInterceptorHandler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler responseInterceptorHandler) async {
    // TODO: implement onResponse
    /* 
      print(
        "<-- ${response.statusCode} ${(response.requestOptions ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL')}");
    
     */
    print(
        "<-- ${response.statusCode} ${(response.requestOptions.uri)}");
    print("Headers:");
    response.headers.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response, responseInterceptorHandler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler errorInterceptorHandler) async {
    // TODO: implement onError
    if(err.response != null) {
      print(
        "<-- ${err.message} ${(err.response?.requestOptions.baseUrl)}");
      print("${err.response != null ? err.response?.data : 'Unknown Error'}");
      print("<-- End error");
    }
    return super.onError(err, errorInterceptorHandler);
  }
}
