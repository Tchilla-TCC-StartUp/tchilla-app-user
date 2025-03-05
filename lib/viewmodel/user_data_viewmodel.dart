import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class UserDataViewModel extends BaseViewModel {
  final RxBool isNameEditable = false.obs;
  final RxBool isEmailEditable = false.obs;
  final RxBool isPasswordEditable = false.obs;


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
