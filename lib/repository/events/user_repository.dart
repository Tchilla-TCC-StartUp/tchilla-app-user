import 'package:tchilla/model/auth_model.dart';
import 'package:tchilla/repository/base_repository.dart';
import 'package:tchilla/repository/interfaces/iuser_repository.dart';

class UserRepository extends BaseRepository implements IuserRepository {


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
   final respose = await post("/Auth/register", data: {
     "nome": name,
     "email": email,
     "telefone": telefone,
     "senha": password,
     "tipo": 0
   });

   return AuthModel.fromMap(respose);
  }
}
