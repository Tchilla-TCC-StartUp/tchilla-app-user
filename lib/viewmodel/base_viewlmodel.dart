// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:tchilla/resources/app_logs.dart';

import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'package:tchilla/services/events/validator.dart';

class BaseViewlmodel extends GetxController {
  final Notificator notificator;
  final Validator validator;
  final Navigation navigator;
  final AppLogs loger;
  BaseViewlmodel(
      {required this.notificator,
      required this.validator,
      required this.navigator,
      required this.loger});
}
