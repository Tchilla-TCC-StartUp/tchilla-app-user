import 'package:tchilla/model/auth_model.dart';

abstract class IuserRepository {
  Future<AuthModel> authUser({
    required String email,
    required String password,
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
