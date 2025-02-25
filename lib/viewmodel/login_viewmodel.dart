import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class LoginViewmodel extends BaseViewlmodel {
  LoginViewmodel(
      {required super.notificator,
      required super.validator,
      required super.navigator,
      required super.loger});

  Future<void> navigateToRegisterPage() {
    return navigator.navigateToRegisterPage();
  }

  login(String email, String password, BuildContext context) async {
    print("Método login chamado");

    if (email.isEmpty || password.isEmpty) {
      loger.info("Campos vazios detectados");
      return notificator.showLocalAlert(
        AppLocalizations.of(context)!.alert_attention,
        AppLocalizations.of(context)!.login_required_fields,
        context,
      );
    }

    if (!validator.validatEmail(email)) {
      loger.info("Email inválido");
      return notificator.showLocalAlert(
        AppLocalizations.of(context)!.alert_attention,
        AppLocalizations.of(context)!.login_invalid_email,
        context,
      );
    }

    if (password.length < 6) {
      loger.info("Senha curta");
      return notificator.showLocalAlert(
        AppLocalizations.of(context)!.alert_attention,
        AppLocalizations.of(context)!.login_password_length,
        context,
      );
    }

    loger.info("Navegando para Home");
    await navigator.navigateToHome();
  }

  navigateToForengePasswordPage() {
    navigator.navigateToForengePassewordEmailPage();
  }
}
