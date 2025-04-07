import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IRegisterViewmodel extends BaseViewModel {
  register();
  void navigateToLoginPage();
  void setEmail(String? value);
  void setPassword(String? value);
  void setName(String? value);
  void setPhoneNumer(String? value);
}
