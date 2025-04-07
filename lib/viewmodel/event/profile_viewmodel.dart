import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/interface/iprofile_viewmodel.dart';

class ProfileViewmodel extends IProfileViewmodel {
  final UserService service;

  ProfileViewmodel({required this.service});
  @override
  goToUserDataPage() {
    return navigator.navigateToUserDataPage();
  }

  @override
  goToNotificatiosPage() {
    return navigator.navigateToNotificationPage();
  }

  @override
  goToSchedulesPage() {
    return navigator.navigateToSchedulesPage();
  }

  @override
  logout() async {
    await cleanToken();
    return navigator.navigateToWelcomePage();
  }
}
