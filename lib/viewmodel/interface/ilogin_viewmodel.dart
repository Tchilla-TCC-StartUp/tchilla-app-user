import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class ILoginViewmodel extends BaseViewModel {
  Future<void> navigateToRegisterPage();
  login();
  void setEmail(String? value);
  void setPassword(String? value);
  navigateToForengePasswordPage();
}
