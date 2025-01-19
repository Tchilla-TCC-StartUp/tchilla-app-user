import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/events/navigation.dart';

class RegisterViewmodel {
  final _navigation = Modular.get<Navigation>();

  Future<void> navigateToLoginPage() {
    return _navigation.navigateToLoginPage();
  }
}
