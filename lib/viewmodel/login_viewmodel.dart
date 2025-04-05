import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel {
  final UserService service;
  final Rxn<String?> email = Rxn<String?>();
  final Rxn<String?> password = Rxn<String?>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  LoginViewmodel({required this.service});

  Future<void> navigateToRegisterPage() {
    return this.navigator.navigateToRegisterPage();
  }

  login() async {
    if (email.value == null || password.value == null) {
      loger.info("Campos vazios detectados");
      return showWarning(
        AppLocalizations.of(context)!.login_required_fields,
      );
    }

    if (!validator.validatEmail(email.value!)) {
      loger.info("Email inválido");
      return showWarning(
        AppLocalizations.of(context)!.login_invalid_email,
      );
    }

    if (password.value!.length < 6) {
      loger.info("Senha curta");
      showWarning(
        AppLocalizations.of(context)!.login_password_length,
      );

      return;
    }

    await onRequest(
      event: service.authUser(email: email.value!, password: password.value!),
      onSuccess: (value) async {
        await dataToken.saveToken(value.data!);
        cleanFields([email, password]);
        this.navigator.navigateToHome();
      },
      onError: (value) {
        showError(value.errorMessage);
      },
    );
  }

  void setEmail(String? value) {
    setFieldChange(email, value);
    loger.info('Email é $email');
  }

  void setPassword(String? value) {
    setFieldChange(password, value);
    loger.info('Password é $password');
  }

  navigateToForengePasswordPage() {
    this.navigator.navigateToForengePassewordEmailPage();
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
