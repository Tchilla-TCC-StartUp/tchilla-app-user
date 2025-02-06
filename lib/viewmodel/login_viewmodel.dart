import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';

class LoginViewmodel {
  final _navigation = Get.find<Navigation>();
  final _notificator = Get.find<Notificator>();
  final _validator = Get.find<Validator>();

  Future<void> navigateToRegisterPage() {
    return _navigation.navigateToRegisterPage();
  }

Future<void> login(
      String email, String password, BuildContext context) async {
    // Verifica se o email está vazio
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

  
    if (password.isEmpty) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "O campo de senha é obrigatório.",
        context,
      );
      return;
    }

    if (password.length < 6) {
      _notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        "Atenção",
        "A senha deve ter pelo menos 6 caracteres.",
        context,
      );
      return;
    }

  
    await _navigation.navigateToHome();
  }


  Future<void> navigateToForengePasswordPage() {
    return _navigation.navigateToForengePassewordEmailPage();
  }
}
