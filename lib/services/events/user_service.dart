import 'package:tchilla/model/auth_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/services/base_services.dart';
import 'package:tchilla/services/interface/iuser_service.dart';

class UserService extends IUserService {
  @override
  Future<UserModel> getUserData({required String token}) {
    return userRepository.getUserData(token: token);
  }

  @override
  Future<AuthModel> authUser(
      {required String email, required String password, String? lang}) {
    return userRepository.authUser(email: email, password: password);
  }

  @override
  Future<AuthModel> registerUser(
      {required String email,
      required String name,
      required String password,
      required String telefone,
      String? lang}) {
    return userRepository.registerUser(
        email: email, name: name, password: password, telefone: telefone);
  }

  @override
  Future<AuthModel> logoutUser({required String token}) {
    return userRepository.logoutUser(token: token);
  }

  @override
  Future<String> updateUser(
      {required String email,
      required String name,
      required String telefone,
      required String token}) {
    return userRepository.updateUser(
        email: email, name: name, telefone: telefone, token: token);
  }

  @override
  Future<AuthModel> resetPasswordUser(
      {required String token,
      required String oldPassword,
      required String newPassword,
      String? lang}) {
    return userRepository.resetPasswordUser(
      token: token,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }
}
