import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dio/dio.dart';

class AppLogs {
  static const String _divider =
      "════════════════════════════════════════════════════════════════════════════════════════════════════";

  /// Método para imprimir divisores no log
  void _printDividerStart() {
    dev.log("╔$_divider");
  }

  void _printDividerEnd() {
    dev.log("╚$_divider");
  }

  /// Adiciona timestamp ao log
  String _timestamp() {
    return "[${DateTime.now().toIso8601String()}]";
  }

  /// Log de mensagens informativas
  void info(String message) {
    _printDividerStart();
    dev.log("${_timestamp()} 🟢 [INFO]: $message");
    _printDividerEnd();
  }

  /// Log de requisição HTTP do Dio Interceptor
  void printRequest({
    required String url,
    required String method,
    required Map<String, dynamic> headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) {
    _printDividerStart();
    dev.log("${_timestamp()} 🌍 [HTTP REQUEST] ➡️ $method $url");
    dev.log("🔹 Query Params: ${jsonEncode(queryParameters)}");
    dev.log("📩 Headers: ${jsonEncode(headers)}");
    dev.log("📝 Body:\n${const JsonEncoder.withIndent('  ').convert(body)}");
    _printDividerEnd();
  }

  /// Log de resposta HTTP do Dio Interceptor
  void printResponse({
    required int? statusCode,
    required dynamic body,
  }) {
    _printDividerStart();
    dev.log("${_timestamp()} 📩 [HTTP RESPONSE] ⬅️ Status: $statusCode");
    dev.log(
        "📜 Response Body:\n${const JsonEncoder.withIndent('  ').convert(body)}");
    _printDividerEnd();
  }

  /// Log de erro HTTP do Dio Interceptor
  void printError({String? info}) {
    _printDividerStart();
    dev.log("${_timestamp()} ❌ [ERROR] $info");
    _printDividerEnd();
  }

  /// Log detalhado de erro de requisição Dio
  void logDioError(DioException err) {
    _printDividerStart();
    dev.log(
        "${_timestamp()} ❌ [DIO ERROR] ${err.response?.statusCode} ${err.requestOptions.uri}");
    dev.log("🔴 Error Message: ${err.message}");
    try {
      dev.log(
          "📝 Response Data:\n${const JsonEncoder.withIndent('  ').convert(err.response?.data)}");
    } catch (e) {
      dev.log("⚠️ Erro ao formatar resposta: ${e.toString()}");
    }
    _printDividerEnd();
  }
}
