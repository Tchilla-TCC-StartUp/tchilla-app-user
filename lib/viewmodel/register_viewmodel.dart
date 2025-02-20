import 'package:flutter/material.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterViewmodel {
  final Navigation navigator;
  final Notificator notificator;
  final Validator validator;

  RegisterViewmodel({
    required this.navigator,
    required this.notificator,
    required this.validator,
  });

  Future<void> register(
    String fullName,
    String email,
    String password,
    BuildContext context,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    if (fullName.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_full_name_required,
        context,
      );
      return;
    }

    if (fullName.length < 10) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_invalid_full_name,
        context,
      );
      return;
    }

    if (email.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_email_required,
        context,
      );
      return;
    }

    if (!validator.validatEmail(email)) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_invalid_email,
        context,
      );
      return;
    }

    if (password.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_password_required,
        context,
      );
      return;
    }

    if (password.length < 6) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_password_length,
        context,
      );
      return;
    }

    await navigator.navigateToHome();
  }

  navigateToLoginPage() {
    navigator.navigateToLoginPage();
  }
}
