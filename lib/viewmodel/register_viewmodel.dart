import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';

class RegisterViewmodel {
  final _navigation = Get.find<Navigation>();

  Future<void> navigateToLoginPage() {
    return _navigation.navigateToLoginPage();
  }
}
