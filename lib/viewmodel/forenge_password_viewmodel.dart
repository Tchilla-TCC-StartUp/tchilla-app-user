import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';

class ForengePasswordViewmodel extends GetxController {
  final Navigation navigator;
  final Notificator notificator;
  final Validator validator;

  ForengePasswordViewmodel({
    required this.navigator,
    required this.notificator,
    required this.validator,
  });

  confirmPin(String pin, BuildContext context) {
    if (pin.length != 6) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atensão",
        "Por favor, preencha todos os campos.",
        context,
      );
    } else {
      return navigator.navigateToRefefinePasswordPage();
    }
  }

  Future<void> resetPassord(
    String passord,
    String confirmPassord,
    BuildContext context,
  ) async {
    if (passord.isEmpty || confirmPassord.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "Os campos de senha são obrigatórios.",
        context,
      );
      return;
    }
    if (passord != confirmPassord) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "As senhas não coincidem.",
        context,
      );
      return;
    }
    if (passord.length < 6) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "A senha deve ter pelo menos 6 caracteres.",
        context,
      );
      return;
    }

    notificator.showLocalAlert(
      AlertStyleEnum.sucess,
      "Sucesso",
      "A senha Redefimnida com sucesso",
      context,
    );
    await Future.delayed(const Duration(seconds: 3));
    await navigator.navigateToLoginPage();
  }

  Future<void> submitEmail(String email, BuildContext context) async {
    if (email.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "O campo de email é obrigatório.",
        context,
      );
      return;
    }

    if (!validator.validatEmail(email)) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "Este email é inválido.",
        context,
      );
      return;
    }

    await navigator.navigateToConfirmationPage();
  }
}
