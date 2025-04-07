import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/base_repository.dart';
import 'package:tchilla/repository/interfaces/iwelcome_repository.dart';

class WelcomeRepository extends IwelcomeRepository {


  @override
  Future<WelcomeModel> fetchWelcomeData(String lang) async {
    final response = await get("/Resource/welcome?lang=$lang");
    return WelcomeModel.fromMap(response);
  }
}
