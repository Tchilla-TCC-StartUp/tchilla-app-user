import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class WelcomeViewmodel {
  final _navigation = Get.find<Navigation>();

  navigateToLogin() {
    _navigation.navigateToLoginPage();
  }

  navigateToRegister() {
    _navigation.navigateToRegisterPage();
  }

  enteraVisitor() {
    _navigation.navigateToHome();
  }
}
