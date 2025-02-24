import 'package:tchilla/model/welcome_model.dart';

abstract class IwelcomeRepository {
  Future<WelcomeModel> fetchWelcomeData(String lang);
}
