
import 'dart:convert';

class AuthModel {
  final bool? isSuccess;
  final String? message;
  final String? errorMessage;
  final String? data;
  AuthModel({
    this.isSuccess,
    this.message,
    this.errorMessage,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isSuccess': isSuccess,
      'message': message,
      'errorMessage': errorMessage,
      'data': data,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      isSuccess: map['isSuccess'] != null ? map['isSuccess'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      errorMessage:
          map['errorMessage'] != null ? map['errorMessage'] as String : null,
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
