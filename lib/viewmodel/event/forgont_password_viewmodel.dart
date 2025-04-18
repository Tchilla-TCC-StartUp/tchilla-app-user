import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/interface/iforgont_password_viewmodel.dart';

class ForgontPasswordViewmodel extends IForgontPasswordViewmodel {
  final Rxn<String> email = Rxn<String>();
  final FocusNode emailFocus = FocusNode();

  final Rxn<String> oldPassword = Rxn<String>();
  final Rxn<String> newPassword = Rxn<String>();
  final Rxn<String> confirmnewPassword = Rxn<String>();
  final UserService service;

  ForgontPasswordViewmodel({required this.service});
  @override
  void confirmPin(String pin) {
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

  @override
  Future<void> resetPassword(
    final String previousWalk,
  ) async {
    final localizations = AppLocalizations.of(context)!;

    if (newPassword.value == null ||
        confirmnewPassword.value == null ||
        oldPassword.value == null) {
      showWarning(localizations.error_password_required);
      return;
    }
    if (newPassword.value != confirmnewPassword.value) {
      showWarning(localizations.error_password_mismatch);
      return;
    }
    if (newPassword.value!.length < 6) {
      showWarning(
        localizations.error_password_length,
      );
      return;
    }

    onEvent(
        event: (token) async {
          await onRequest(
              event: service.resetPasswordUser(
                  token: token,
                  oldPassword: oldPassword.value ?? "",
                  newPassword: newPassword.value ?? ""),
              onSuccess: (data) async {
                showSuccess(
                  data.message ?? "",
                );
                await Future.delayed(const Duration(seconds: 3));
                if (previousWalk == AppRoutes.userdataPage) {
                  await this.navigator.navigateToBack();
                } else {
                  await this.navigator.navigateToLoginPage();
                }
              });
        },
        checkLogin: true);
  }

  @override
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

  @override
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
  void setConfirmNewPassword(String? value) {
    setFieldChange(confirmnewPassword, value);
    loger.info('Confirm Password é $confirmnewPassword');
  }

  @override
  void setNewPassword(String? value) {
    setFieldChange(newPassword, value);
    loger.info('New Password é $newPassword');
  }

  @override
  void setOldPassword(String? value) {
    setFieldChange(oldPassword, value);
    loger.info('Old Password é $oldPassword');
  }
}
