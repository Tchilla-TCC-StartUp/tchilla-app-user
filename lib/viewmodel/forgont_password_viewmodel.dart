import 'package:flutter/material.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ForgontPasswordViewmodel extends BaseViewModel {
  ForgontPasswordViewmodel({
    required super.navigator,
    required super.notificator,
    required super.validator,
    required super.loger,
  });

  void confirmPin(String pin, BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (pin.length != 6) {
      showWarning(
        context,
        localizations.error_fill_all_fields,
      );
    } else {
      return navigator.navigateToRefefinePasswordPage(
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
      showWarning(context, localizations.error_password_required);
      return;
    }
    if (password != confirmPassword) {
      showWarning(context, localizations.error_password_mismatch);
      return;
    }
    if (password.length < 6) {
      showWarning(
        context,
        localizations.error_password_length,
      );
      return;
    }
    showSuccess(
      context,
      localizations.success_password_reset,
    );

    await Future.delayed(const Duration(seconds: 3));

    if (previousWalk == AppRoutes.userdataPage) {
      await navigator.navigateToBack();
    } else {
      await navigator.navigateToLoginPage();
    }
  }

  Future<void> submitEmail(String email, BuildContext context) async {
    final localizations = AppLocalizations.of(context)!;

    if (email.isEmpty) {
      showWarning(
        context,
        localizations.error_email_required,
      );
      return;
    }

    if (!validator.validatEmail(email)) {
      showWarning(
        context,
        localizations.error_invalid_email,
      );

      return;
    }

    await navigator.navigateToConfirmationPage();
  }
}
