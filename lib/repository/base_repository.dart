import 'package:get/get.dart' as getx;
import 'package:dio/dio.dart';
import 'package:tchilla/resources/app_exception.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class BaseRepository {
  final Navigation navigator = getx.Get.find();
  final Notificator notificator = getx.Get.find();
  final Dio dio = getx.Get.find();

  BuildContext get context => notificator.snackbarKey.currentContext!;

  /// Método genérico para requisições GET
  Future<T> get<T>(String endpoint,
      {Map<String, dynamic>? queryParameters, Options? option}) async {
    try {
      final response = await dio.get("/api$endpoint",
          queryParameters: queryParameters, options: option);
      return _handleResponse<T>(
          notificator.snackbarKey.currentContext!, response);
    } catch (e) {
      throw _handleError(notificator.snackbarKey.currentContext!, e);
    }
  }

  /// Método genérico para requisições POST
  Future<T> post<T>(String endpoint, {dynamic data, Options? option}) async {
    try {
      final response = await dio.post("/api$endpoint", data: data, options: option);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Método genérico para requisições PUT
  Future<T> put<T>(String endpoint, {dynamic data, Options? option}) async {
    try {
      final response = await dio.put("/api$endpoint", data: data, options: option);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Método genérico para requisições DELETE
  Future<T> delete<T>(String endpoint, Options? option) async {
    try {
      final response = await dio.delete("/api$endpoint", options: option);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  T _handleResponse<T>(BuildContext context, Response response) {
    final l10n = AppLocalizations.of(context)!;

    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw ValidationException(
          response.data['error'] ?? response.statusMessage ?? l10n.invalidRequest,
        );
      case 401:
        throw UnauthorizedException(
          response.data['error'] ?? response.statusMessage ?? l10n.unauthorizedAccess,
        );
      case 403:
        throw AuthException(
          response.data['error'] ?? response.statusMessage ?? l10n.unauthorizedAccess,
        );
      case 404:
        throw NetworkException(
          response.data['error'] ?? response.statusMessage ?? l10n.resourceNotFound,
        );
      case 500:
        throw ServerException(
          response.data['error'] ?? response.statusMessage ?? l10n.internalServerError,
        );
      default:
        throw UnknownException("${l10n.unknownError} ${response.statusCode}");
    }
  }

  AppException _handleError(BuildContext context, dynamic error) {
    final l10n = AppLocalizations.of(context)!;

    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final errorMessage = error.response?.data['error'] ??
          error.response?.statusMessage ??
          _getErrorMessage(error, l10n);

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkException(errorMessage);

        case DioExceptionType.badResponse:
          switch (statusCode) {
            case 400:
              return ValidationException(errorMessage);
            case 401:
              return UnauthorizedException(errorMessage);
            case 403:
              return AuthException(errorMessage);
            case 404:
              return NetworkException(errorMessage);
            case 500:
              return ServerException(errorMessage);
            default:
              return UnknownException("${l10n.unknownError} $statusCode");
          }

        case DioExceptionType.connectionError:
          return SocketException(errorMessage);

        case DioExceptionType.cancel:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.unknown:
        default:
          return UnknownException(errorMessage);
      }
    }

    return UnknownException(error.toString());
  }


  String _getErrorMessage(DioException error, AppLocalizations l10n) {
    if (error.response?.data is Map<String, dynamic>) {
      final data = error.response!.data as Map<String, dynamic>;
      if (data.containsKey("error") && data["error"] is String) {
        return data["error"];
      }
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return l10n.connectionTimeout;
      case DioExceptionType.badResponse:
        return l10n.serverResponseError;
      case DioExceptionType.cancel:
        return l10n.requestCancelled;
      case DioExceptionType.connectionError:
        return l10n.noInternetConnection;
      default:
        return l10n.unexpectedConnectionError;
    }
  }
}
