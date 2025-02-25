import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class UserDataViewModel extends BaseViewlmodel {
  final RxBool isNameEditable = false.obs;
  final RxBool isEmailEditable = false.obs;
  final RxBool isPasswordEditable = false.obs;

  UserDataViewModel(
      {required super.notificator,
      required super.validator,
      required super.navigator,
      required super.loger});

  void toggleNameEditable() {
    isNameEditable.value = !isNameEditable.value;
  }

  void toggleEmailEditable() {
    isEmailEditable.value = !isEmailEditable.value;
  }

  void togglePasswordEditable() {
    // isPasswordEditable.value = !isPasswordEditable.value;
    this.navigator.navigateToRefefinePasswordPage(AppRoutes.userdataPage);
  }
}
