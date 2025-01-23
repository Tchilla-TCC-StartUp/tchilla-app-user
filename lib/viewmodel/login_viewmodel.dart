import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class LoginViewmodel {
  final _navigation = Get.find<Navigation>();

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
