import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class RegisterViewmodel extends BaseViewlmodel {
  RegisterViewmodel({
    required super.notificator,
    required super.validator,
    required super.navigator,
    required super.loger,
  });

  Future<void> register(
    String name,
    String email,
    String password,
    BuildContext context,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    if (name.isEmpty) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_full_name_required,
        context,
      );
      return;
    }

    if (email.isEmpty) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_email_required,
        context,
      );
      return;
    }

    if (!validator.validatEmail(email)) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_invalid_email,
        context,
      );
      return;
    }

    if (password.isEmpty) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_password_required,
        context,
      );
      return;
    }

    if (password.length < 6) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_password_length,
        context,
      );
      return;
    }

    await navigateToLoginPage();
  }

  navigateToLoginPage() {
    navigator.navigateToLoginPage();
  }
}
