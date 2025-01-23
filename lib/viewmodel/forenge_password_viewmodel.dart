import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class ForengePasswordViewmodel {
  final _navigation = Get.find<Navigation>();

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
