import 'package:get/get.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';

class ProfileViewmodel extends GetMaterialController {
  final Navigation navigator;
  final Notificator notificator;

  ProfileViewmodel({required this.navigator, required this.notificator});
}
