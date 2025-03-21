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
      final response = await dio.get(endpoint,
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
      final response = await dio.post(endpoint, data: data, options: option);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Método genérico para requisições PUT
  Future<T> put<T>(String endpoint, {dynamic data, Options? option}) async {
    try {
      final response = await dio.put(endpoint, data: data, options: option);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Método genérico para requisições DELETE
  Future<T> delete<T>(String endpoint, Options? option) async {
    try {
      final response = await dio.delete(endpoint, options: option);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Manipulação genérica de resposta HTTP
  T _handleResponse<T>(BuildContext context, Response response) {
    final l10n = AppLocalizations.of(context)!;

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else if (response.statusCode == 400) {
      throw ValidationException(
        response.statusMessage ?? l10n.invalidRequest,
      );
    } else if (response.statusCode == 401 || response.statusCode == 403) {
      throw AuthException(response.statusMessage ?? l10n.unauthorizedAccess);
    } else if (response.statusCode == 404) {
      throw NetworkException(response.statusMessage ?? l10n.resourceNotFound);
    } else if (response.statusCode == 500) {
      throw ServerException(response.statusMessage ?? l10n.internalServerError);
    } else {
      throw UnknownException("${l10n.unknownError} ${response.statusCode}");
    }
  }

  AppException _handleError(BuildContext context, dynamic error) {
    final l10n = AppLocalizations.of(context)!;

    if (error is DioException) {
      String errorMessage = _getErrorMessage(error, l10n);

      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return NetworkException(errorMessage);
      } else if (error.type == DioExceptionType.badResponse) {
        return ServerException(errorMessage);
      } else if (error.type == DioExceptionType.cancel) {
        return UnknownException(errorMessage);
      } else if (error.type == DioExceptionType.connectionError) {
        return SocketException(errorMessage);
      } else {
        return UnknownException(errorMessage);
      }
    }
    return UnknownException(error.toString());
  }

  /// Método que extrai a mensagem de erro do response ou usa o l10n como fallback
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
