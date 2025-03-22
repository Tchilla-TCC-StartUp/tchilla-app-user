import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class ForgontPasswordViewmodel extends BaseViewModel {
  final Rxn<String> email = Rxn<String>();
  final FocusNode emailFocus = FocusNode();
  void confirmPin(String pin, BuildContext context) {
    if (pin.length != 6) {
      showWarning(
        localizations.error_fill_all_fields,
      );
    } else {
      this.navigator.navigateToRefefinePasswordPage(
            AppRoutes.redefinePasswordPage,
          );
      return;
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
      showWarning(localizations.error_password_required);
      return;
    }
    if (password != confirmPassword) {
      showWarning(localizations.error_password_mismatch);
      return;
    }
    if (password.length < 6) {
      showWarning(
        localizations.error_password_length,
      );
      return;
    }
    showSuccess(
      localizations.success_password_reset,
    );

    await Future.delayed(const Duration(seconds: 3));

    if (previousWalk == AppRoutes.userdataPage) {
      await this.navigator.navigateToBack();
    } else {
      await this.navigator.navigateToLoginPage();
    }
  }

  Future<void> submitEmail() async {
    if (email.value!.isEmpty) {
      showWarning(
        localizations.error_email_required,
      );
      return;
    }

    if (!validator.validatEmail(email.value!)) {
      showWarning(
        localizations.error_invalid_email,
      );

      return;
    }

    await this.navigator.navigateToConfirmationPage();
  }

  void chengeEmail(String? value) {
    loger.info("Email: $email");
    return setFieldChange(email, value);
  }

  @override
  void dispose() {
    super.dispose();
    emailFocus.dispose();
  }
  
  @override
  void initEvet() {
    // TODO: implement initEvet
  }
}
