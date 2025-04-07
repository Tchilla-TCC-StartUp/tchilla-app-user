import 'package:tchilla/viewmodel/base_viewmodel.dart';

abstract class IProfileViewmodel extends BaseViewModel {
  goToUserDataPage();
  goToNotificatiosPage();
  goToSchedulesPage();
  logout();
}
