import 'package:tchilla/model/welcome_model.dart';

abstract class IWelcomeService {
  Future<WelcomeModel> fetchWelcomeData(String lang);
}
