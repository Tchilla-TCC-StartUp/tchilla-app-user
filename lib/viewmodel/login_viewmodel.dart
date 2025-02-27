import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel {
  LoginViewmodel(
      {required super.notificator,
      required super.validator,
      required super.navigator,
      required super.loger});

  Future<void> navigateToRegisterPage() {
    return navigator.navigateToRegisterPage();
  }

  login(String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      loger.info("Campos vazios detectados");
      return showWarning(
        context,
        AppLocalizations.of(context)!.login_required_fields,
      );
    }

    if (!validator.validatEmail(email)) {
      loger.info("Email inválido");
      return showWarning(
        context,
        AppLocalizations.of(context)!.login_invalid_email,
      );
    }

    if (password.length < 6) {
      loger.info("Senha curta");
      return showWarning(
        context,
        AppLocalizations.of(context)!.login_password_length,
      );
    }

    loger.info("Navegando para Home");
    await navigator.navigateToHome();
  }

  navigateToForengePasswordPage() {
    navigator.navigateToForengePassewordEmailPage();
  }
}
