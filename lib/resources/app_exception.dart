class AppException implements Exception {
  final String message;
  final int? code;

  AppException(this.message, {this.code});

  @override
  String toString() => "AppException: $message";
}

class NetworkException extends AppException {
  NetworkException(String message, {int? code}) : super(message, code: code);
}

class AuthException extends AppException {
  AuthException(String message, {int? code}) : super(message, code: code);
}

class ValidationException extends AppException {
  ValidationException(String message, {int? code}) : super(message, code: code);
}

class ServerException extends AppException {
  ServerException(String message, {int? code}) : super(message, code: code);
}

class UnknownException extends AppException {
  UnknownException(String message, {int? code}) : super(message, code: code);
}
