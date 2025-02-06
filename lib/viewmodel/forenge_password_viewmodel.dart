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

  confirmPin(String pin, BuildContext context) {
    if (pin.length != 6) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atensão",
        "Por favor, preencha todos os campos.",
        context,
      );
    } else {
      return _navigation.navigateToRefefinePasswordPage();
    }
  }

  Future<void> resetPassord(
    String passord,
    String confirmPassord,
    BuildContext context,
  ) async {
    if (passord.isEmpty || confirmPassord.isEmpty) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "Os campos de senha são obrigatórios.",
        context,
      );
      return;
    }
    if (passord != confirmPassord) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "As senhas não coincidem.",
        context,
      );
      return;
    }
    if (passord.length < 6) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "A senha deve ter pelo menos 6 caracteres.",
        context,
      );
      return;
    }

    _notificator.showLocalAlert(
      AlertStyleEnum.sucess,
      "Sucesso",
      "A senha Redefimnida com sucesso",
      context,
    );
    await Future.delayed(const Duration(seconds: 3));
    await _navigation.navigateToLoginPage();
  }

  Future<void> submitEmail(String email, BuildContext context) async {
    if (email.isEmpty) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "O campo de email é obrigatório.",
        context,
      );
      return;
    }

    if (!_validator.validatEmail(email)) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "Este email é inválido.",
        context,
      );
      return;
    }

    await _navigation.navigateToConfirmationPage();
  }
}
