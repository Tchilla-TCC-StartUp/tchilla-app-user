import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/events/navigation.dart';

class ForengePasswordViewmodel {
  final _navigation = Modular.get<Navigation>();

  Future<void> navigateToConfirmationPage() {
    return _navigation.navigateToConfirmationPage();
  }

   Future<void> navigateToRedefinePasswordPage() {
    return _navigation.navigateToRefefinePasswordPage();
  }

   Future<void> navigateToLoginPage() {
    return _navigation.navigateToLoginPage();
  }
}
