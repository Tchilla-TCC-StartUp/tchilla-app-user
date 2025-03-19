import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ProfileViewmodel extends BaseViewModel {
  goToUserDataPage(String id) {
    return navigator.navigateToUserDataPage(id);
  }

  logout() async {
    await cleanToken();
    return navigator.navigateToWelcomePage();
  }
}
