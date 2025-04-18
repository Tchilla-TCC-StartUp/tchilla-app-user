import 'package:tchilla/model/auth_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/repository/base_repository.dart';

abstract class IuserRepository extends BaseRepository {
  Future<AuthModel> authUser({
    required String email,
    required String password,
    String? lang,
  });

  Future<String> updateUser({
    required String email,
    required String name,
    required String telefone,
    required String token,
    String? lang,
  });

  Future<AuthModel> registerUser({
    required String email,
    required String name,
    required String password,
    required String telefone,
    String? lang,
  });
  
  Future<AuthModel> logoutUser({
    required String token,
    String? lang,
  });

  Future<AuthModel> resetPasswordUser({
    required String token,
    required String oldPassword,
    required String newPassword,
    String? lang,
  });



  Future<UserModel> getUserData({
    required String token,
    String? lang,
  });
}
