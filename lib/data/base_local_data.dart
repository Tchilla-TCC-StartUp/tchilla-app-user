import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tchilla/resources/app_constats.dart';

class BaseLocalData {
  final SharedPreferences _shared = Get.find();
  final AppConstats _appconstats = Get.find();

  SharedPreferences get shared => _shared;
  AppConstats get appconstats => _appconstats;
}
