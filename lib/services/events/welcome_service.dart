import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/services/base_services.dart';
import 'package:tchilla/services/interface/iwelcome_service.dart';

class WelcomeService extends BaseServices implements IWelcomeService {
  @override
  Future<WelcomeModel> fetchWelcomeData(String lang) {
    return welcomeRepository.fetchWelcomeData(lang);
  }
}
