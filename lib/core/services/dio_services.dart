import 'package:dio/dio.dart';
import 'package:wltm_test/core/utils/utils.dart';

import 'app_interceptors.dart';
import 'logger_interceptors.dart';

class DioService {
  final String? token;
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 30000),
      receiveTimeout: const Duration(milliseconds: 30000),
      baseUrl: baseUrl,
    ),
  );
  DioService({this.token}) {
    dio.interceptors.addAll([
      AppInterceptor(), LoggerInterceptor()
    ]);
  }
}
