import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/services/base_services.dart';

abstract class IWelcomeService extends BaseServices {
  Future<WelcomeModel> fetchWelcomeData(String lang);
}
