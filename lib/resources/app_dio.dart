import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/%20app_interceptor.dart';
import 'package:tchilla/resources/app_constats.dart';

class AppDio {
  final _dio = Dio(
    BaseOptions(
      baseUrl: AppConstats.baseUrl,
      sendTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
    ),
  )..interceptors.add(
      AppInterceptor(logger: Get.find()),
    );

  Dio get dio => _dio;
}
