import 'package:get/get.dart';
import 'package:tchilla/services/events/navigation.dart';

class WelcomeViewmodel {
  final Navigation navigator;

  WelcomeViewmodel({required this.navigator});

  navigateToLogin() {
    navigator.navigateToLoginPage();
  }

  navigateToRegister() {
    navigator.navigateToRegisterPage();
  }

  enteraVisitor() {
    navigator.navigateToHome();
  }
}
