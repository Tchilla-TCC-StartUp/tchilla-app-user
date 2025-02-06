import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';

class ForengePasswordViewmodel extends GetxController {
  final _navigation = Get.find<Navigation>();
  final _notificator = Get.find<Notificator>();
  final _validator = Get.find<Validator>();

  void confirmPin(String pin, BuildContext context) {
    if (pin.length != 6) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atensão",
        "Por favor, preencha todos os campos.",
        context,
      );
    } else {
      navigateToRedefinePasswordPage();
    }
  }

  Future<void> navigateToRedefinePasswordPage() {
    return _navigation.navigateToRefefinePasswordPage();
  }

  submitEmail(String email, BuildContext context) {
    if (email.isEmpty) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atensão",
        "O campo de email é obrigatório",
        context,
      );
    } else if (_validator.validatEmail(email)) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atensão",
        "Email inválido.",
        context,
      );
    } else {
      _navigation.navigateToConfirmationPage();
    }
  }

  Future<void> navigateToLoginPage() {
    return _navigation.navigateToLoginPage();
  }
}
