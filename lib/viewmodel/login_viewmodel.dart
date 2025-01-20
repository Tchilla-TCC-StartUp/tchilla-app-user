import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/events/navigation.dart';

class LoginViewmodel {
  final _navigation = Modular.get<Navigation>();

  Future<void> navigateToRegisterPage() {
    return _navigation.navigateToRegisterPage();
  }

  Future<void> navigateToHomePagePage() {
    return _navigation.navigateToHome();
  }

  Future<void> navigateToForengePasswordPage() {
    return _navigation.navigateToForengePassewordEmailPage();
  }
}
