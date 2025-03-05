import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class RegisterViewmodel extends BaseViewModel {


  Future<void> register(
    String name,
    String email,
    String password,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    if (name.isEmpty) {
      return showWarning(
        localizations.error_full_name_required,
      );
    }

    if (email.isEmpty) {
      return showWarning(
        localizations.error_email_required,
      );
    }

    if (!validator.validatEmail(email)) {
      return showWarning(
        localizations.error_invalid_email,
      );
    }

    if (password.isEmpty) {
      return showWarning(
        localizations.error_password_required,
      );
    }

    if (password.length < 6) {
      return showWarning(
        localizations.error_password_length,
      );
    }

    await navigateToLoginPage();
  }

  navigateToLoginPage() {
    navigator.navigateToLoginPage();
  }
}
