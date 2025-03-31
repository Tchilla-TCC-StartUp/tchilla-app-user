import 'package:tchilla/model/auth_model.dart';
import 'package:tchilla/model/user_model.dart';
import 'package:tchilla/services/base_services.dart';
import 'package:tchilla/services/interface/iuser_service.dart';

class UserService extends BaseServices implements IUserService {
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
}
