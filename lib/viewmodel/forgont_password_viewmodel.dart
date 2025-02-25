import 'package:flutter/material.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class ForgontPasswordViewmodel extends BaseViewlmodel {
  ForgontPasswordViewmodel({
    required super.navigator,
    required super.notificator,
    required super.validator,
    required super.loger,
  });

  void confirmPin(String pin, BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (pin.length != 6) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_fill_all_fields,
        context,
      );
    } else {
      return this.navigator.navigateToRefefinePasswordPage(
            AppRoutes.redefinePasswordPage,
          );
    }
  }

  Future<void> resetPassword(
    String password,
    String confirmPassword,
    BuildContext context,
    final String previousWalk,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    if (password.isEmpty || confirmPassword.isEmpty) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_password_required,
        context,
      );
      return;
    }
    if (password != confirmPassword) {
      notificator.showLocalAlert(
        localizations.alert_attention,
        localizations.error_password_mismatch,
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

    notificator.showLocalASucess(
      localizations.alert_success,
      localizations.success_password_reset,
      context,
    );
    await Future.delayed(const Duration(seconds: 3));

    if (previousWalk == AppRoutes.userdataPage) {
      await this.navigator.navigateToBack();
    } else {
      await this.navigator.navigateToLoginPage();
    }
  }

  Future<void> submitEmail(String email, BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;

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

    await this.navigator.navigateToConfirmationPage();
  }
}
