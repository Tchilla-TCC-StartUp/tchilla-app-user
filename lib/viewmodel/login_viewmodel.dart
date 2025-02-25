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

  Future<void> login(
      String email, String password, BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;

    if (email.isEmpty || password.isEmpty) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.login_required_fields,
        context,
      );
      return;
    }

    if (!validator.validatEmail(email)) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.login_invalid_email,
        context,
      );
      return;
    }

    if (password.length < 6) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.login_password_length,
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
