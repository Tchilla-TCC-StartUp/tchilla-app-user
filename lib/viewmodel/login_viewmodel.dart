import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final localizations = AppLocalizations.of(context)!;

    if (email.isEmpty || password.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.login_required_fields,
        context,
      );
      return;
    }

    if (!validator.validatEmail(email)) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.login_invalid_email,
        context,
      );
      return;
    }

    if (password.length < 6) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
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
