import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';

class LoginViewmodel {
  final Navigation navigator;
  final Notificator notificator;
  final Validator validator;

  LoginViewmodel({
    required this.navigator,
    required this.notificator,
    required this.validator,
  });

  Future<void> navigateToRegisterPage() {
    return navigator.navigateToRegisterPage();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "Todos os campos são obrigatório para o login.",
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

    if (password.length < 6) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "A senha deve ter pelo menos 6 caracteres.",
        context,
      );
      return;
    }

    await navigator.navigateToHome();
  }

  navigateToForengePasswordPage() {
    navigator.navigateToForengePassewordEmailPage();
  }
}
