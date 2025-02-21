import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';

class UserDataViewModel extends GetxController {
  final RxBool isNameEditable = false.obs;
  final RxBool isEmailEditable = false.obs;
  final RxBool isPasswordEditable = false.obs;

  final Navigation navigator;
  final Notificator notificator;
  final Validator validator;

  UserDataViewModel(
      {required this.navigator,
      required this.notificator,
      required this.validator});

  void toggleNameEditable() {
    isNameEditable.value = !isNameEditable.value;
  }

  void toggleEmailEditable() {
    isEmailEditable.value = !isEmailEditable.value;
  }

  void togglePasswordEditable() {
    // isPasswordEditable.value = !isPasswordEditable.value;
    navigator.navigateToRefefinePasswordPage(AppRoutes.userdataPage);
  }
}
