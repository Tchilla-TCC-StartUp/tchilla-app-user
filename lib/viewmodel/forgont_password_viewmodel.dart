import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/style/app_alert_style.dart';
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/util/events/notificator.dart';
import 'package:tchilla/util/events/validator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgontPasswordViewmodel extends GetxController {
  final Navigation navigator;
  final Notificator notificator;
  final Validator validator;

  ForgontPasswordViewmodel({
    required this.navigator,
    required this.notificator,
    required this.validator,
  });

  void confirmPin(String pin, BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (pin.length != 6) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_fill_all_fields,
        context,
      );
    } else {
      return navigator.navigateToRefefinePasswordPage();
    }
  }

  Future<void> resetPassword(
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    if (password.isEmpty || confirmPassword.isEmpty) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_password_required,
        context,
      );
      return;
    }
    if (password != confirmPassword) {
      notificator.showLocalAlert(
        AlertStyleEnum.pedding,
        localizations.alert_attention,
        localizations.error_password_mismatch,
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

    notificator.showLocalAlert(
      AlertStyleEnum.sucess,
      localizations.alert_success,
      localizations.success_password_reset,
      context,
    );
    await Future.delayed(const Duration(seconds: 3));
    await navigator.navigateToLoginPage();
  }

  Future<void> submitEmail(String email, BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;

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

    await navigator.navigateToConfirmationPage();
  }
}
