import 'package:dio/dio.dart';
import 'package:tchilla/resources/app_exception.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

class BaseRepository {
  final Navigation navigator;
  final Notificator notificator;
  final Dio dio;

  BaseRepository({
    required this.dio,
    required this.navigator,
    required this.notificator,
  });

  /// Método genérico para requisições GET
  Future<T> get<T>(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(endpoint, queryParameters: queryParameters);
      return _handleResponse<T>(
          notificator.snackbarKey.currentContext!, response);
    } catch (e) {
      throw _handleError(notificator.snackbarKey.currentContext!, e);
    }
  }

  /// Método genérico para requisições POST
  Future<T> post<T>(BuildContext context, String endpoint,
      {dynamic data}) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Método genérico para requisições PUT
  Future<T> put<T>(BuildContext context, String endpoint,
      {dynamic data}) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return _handleResponse<T>(context, response);
    } catch (e) {
      throw _handleError(context, e);
    }
  }

  /// Método genérico para requisições DELETE
  Future<T> delete<T>(BuildContext context, String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
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
      if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return NetworkException(l10n.connectionTimeout);
      } else if (error.type == DioExceptionType.badResponse) {
        return ServerException(l10n.serverResponseError);
      } else if (error.type == DioExceptionType.cancel) {
        return UnknownException(l10n.requestCancelled);
      } else if (error.type == DioExceptionType.connectionError) {
        return SocketException(l10n.noInternetConnection);
      } else {
        return UnknownException(l10n.unexpectedConnectionError);
      }
    }
    return UnknownException(error.toString());
  }
}
