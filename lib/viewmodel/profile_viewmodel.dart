import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ProfileViewmodel extends BaseViewModel {
  final UserService service;

  ProfileViewmodel({required this.service});
  goToUserDataPage() {
    return navigator.navigateToUserDataPage();
  }

  logout() async {
    await cleanToken();
    return navigator.navigateToWelcomePage();
  }
}
