import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IWelcomeViewmodel extends BaseViewModel {
  void getWelcomeData();
  void navigateToLogin();
  void navigateToRegister();
  void enterAsVisitor();
}
