import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class ProfileViewmodel extends BaseViewlmodel {
  ProfileViewmodel({
    required super.notificator,
    required super.validator,
    required super.navigator,
    required super.loger,
  });

  goToUserDataPage(String id) {
    return navigator.navigateToUserDataPage(id);
  }

  logout() {
    return navigator.navigateToWelcomePage();
  }
}
