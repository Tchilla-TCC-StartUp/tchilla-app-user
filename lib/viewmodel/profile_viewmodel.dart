import 'package:get/get.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';

class ProfileViewmodel extends GetMaterialController {
  final Navigation navigator;
  final Notificator notificator;

  ProfileViewmodel({required this.navigator, required this.notificator});

  Future<void> goToUserDataPage(String id) {
    return navigator.navigateToUserDataPage(id);
  }
}
