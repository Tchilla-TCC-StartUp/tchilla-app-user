import 'package:tchilla/model/auth_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/services/base_services.dart';

abstract class IUserService extends BaseServices {
  Future<UserModel> getUserData({required String token});

  Future<String> updateUser({
    required String email,
    required String name,
    required String telefone,
    required String token,
  });

  Future<AuthModel> logoutUser({required String token});

  Future<AuthModel> authUser({
    required String email,
    required String password,
    String? lang,
  });
  Future<AuthModel> resetPasswordUser({
    required String token,
    required String oldPassword,
    required String newPassword,
    String? lang,
  });
  Future<AuthModel> registerUser({
    required String email,
    required String name,
    required String password,
    required String telefone,
    String? lang,
  });
}
