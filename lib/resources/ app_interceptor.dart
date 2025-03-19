import 'package:dio/dio.dart';
import 'package:tchilla/resources/app_logs.dart';

class AppInterceptor extends Interceptor {
  final AppLogs logger;

  AppInterceptor({required this.logger});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.printRequest(
      url: options.uri.toString(),
      method: options.method,
      headers: options.headers,
      body: options.data,
      queryParameters: options.queryParameters,
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    logger.printResponse(
      statusCode: response.statusCode,
      body: response.data,
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.printError(info: err.response?.statusMessage);
    logger.logDioError(err);

    super.onError(err, handler);
  }
}
