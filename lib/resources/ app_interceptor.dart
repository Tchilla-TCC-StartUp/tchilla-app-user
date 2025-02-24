import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AppInterceptor extends Interceptor {
  final Logger logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i("🌍 [REQUEST] ${options.method} ${options.uri}");
    logger.d("🔹 Headers: ${options.headers}");

    if (options.data != null) {
      logger.d("📤 Body: ${jsonEncode(options.data)}");
    }

    if (options.queryParameters.isNotEmpty) {
      logger.d("📝 Query Params: ${options.queryParameters}");
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.i(
        "✅ [RESPONSE] ${response.statusCode} ${response.requestOptions.uri}");
    logger.d("📥 Data: ${jsonEncode(response.data)}");

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e("❌ [ERROR] ${err.response?.statusCode} ${err.requestOptions.uri}");
    logger.e("📝 Response Data: ${err.response?.data}");
    logger.e("🔴 Error Message: ${err.message}");

    super.onError(err, handler);
  }
}
