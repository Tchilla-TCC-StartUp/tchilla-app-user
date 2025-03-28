class AppException implements Exception {
  final String message;
  final int? code;

  AppException(this.message, {this.code});

  @override
  String toString() => message;
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

class UnauthorizedException extends AppException {
  UnauthorizedException(String message, {int? code})
      : super(message, code: code);
}

class SocketException extends AppException {
  SocketException(String message, {int? code}) : super(message, code: code);
}
