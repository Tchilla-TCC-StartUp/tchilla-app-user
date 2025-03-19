import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:tchilla/repository/events/user_repository.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class RegisterViewmodel extends BaseViewModel {
  final UserRepository repository;
  final RxString countryCode = ''.obs;
  RegisterViewmodel({required this.repository});

  Future<void> register(
    String name,
    String email,
    String password,
    String telefone,
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
    await onRequest(
      event: repository.registerUser(
        email: email,
        name: name,
        password: password,
        telefone: "$countryCode$telefone",
      ),
      onSuccess: (value)  {
        this.navigator.navigateToLoginPage();
      },
      onError: (error){
        showError(error.errorMessage);
    }
    );
    await navigateToLoginPage();
  }

  navigateToLoginPage() {
    this.navigator.navigateToLoginPage();
  }
}
