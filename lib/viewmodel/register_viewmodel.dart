import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';

class RegisterViewmodel {
  final Navigation navigator;
  final Notificator notificator;
  final Validator validator;

  RegisterViewmodel({
    required this.navigator,
    required this.notificator,
    required this.validator,
  });

  navigateToLoginPage() {
    return navigator.navigateToLoginPage();
  }
}
