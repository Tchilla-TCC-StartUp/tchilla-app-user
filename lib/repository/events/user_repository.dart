import 'package:dio/dio.dart';
import 'package:tchilla/model/auth_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/repository/base_repository.dart';
import 'package:tchilla/repository/interfaces/iuser_repository.dart';

class UserRepository extends IuserRepository {
  @override
  Future<AuthModel> authUser({
    required String email,
    required String password,
    String? lang,
  }) async {
    final respose = await post(
      "/Auth/login",
      data: {"emailOrUsername": email, "password": password},
    );

    return AuthModel.fromMap(respose);
  }

  @override
  Future<AuthModel> registerUser({
    required String email,
    required String name,
    required String password,
    required String telefone,
    String? lang,
  }) async {
    final respose = await post(
      "/Auth/register",
      data: {
        "nome": name,
        "email": email,
        "telefone": telefone,
        "senha": password,
        "tipo": 0
      },
    );

    return AuthModel.fromMap(respose);
  }

  @override
  Future<UserModel> getUserData({required String token, String? lang}) async {
    final response = await get('/Usuario/getInfoByToken',
        option: Options(headers: {
          "Authorization": token,
        }));

    return UserModel.fromMap(response['data']);
  }

  @override
  Future<AuthModel> logoutUser({required String token, String? lang}) async {
    final response = await put('/Auth/logout',
        option: Options(headers: {
          "Authorization": token,
        }));

    return AuthModel.fromMap(response);
  }

  @override
  Future<String> updateUser(
      {required String email,
      required String name,
      required String telefone,
      required String token,
      String? lang}) async {
    final response = await put(
      '/Usuario/update',
      data: {
        "nome": name,
        "email": email,
        "telefone": telefone,
      },
      option: Options(
        headers: {
          "Authorization": token,
        },
      ),
    );

    return response['mensagem'];
  }

  @override
  Future<AuthModel> resetPasswordUser(
      {required String token,
      required String oldPassword,
      required String newPassword,
      String? lang})async {
    final response = await put('/Auth/change-password?oldPassword=$oldPassword&newPassword=$newPassword',
        option: Options(headers: {
          "Authorization": token,
        }));

    return AuthModel.fromMap(response);
  }
}
