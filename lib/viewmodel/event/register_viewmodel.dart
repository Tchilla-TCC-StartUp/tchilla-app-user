import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/services/events/user_service.dart';
import 'package:tchilla/viewmodel/interface/iregister_viewmodel.dart';

class RegisterViewmodel extends IRegisterViewmodel {
  final UserService service;
  RegisterViewmodel({required this.service});
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final RxString countryCode = ''.obs;

  final Rxn<String?> email = Rxn<String?>();
  final Rxn<String?> password = Rxn<String?>();
  final Rxn<String?> name = Rxn<String?>();
  final Rxn<String?> telefone = Rxn<String?>();

  @override
  register() async {
    if (name.value == null || name.value!.trim().isEmpty) {
      return showWarning(localizations.error_full_name_required);
    }

    if (email.value == null || email.value!.trim().isEmpty) {
      return showWarning(localizations.error_email_required);
    }

    if (!validator.validatEmail(email.value!.trim())) {
      return showWarning(localizations.error_invalid_email);
    }

    if (password.value == null || password.value!.isEmpty) {
      return showWarning(localizations.error_password_required);
    }

    if (password.value!.length < 6) {
      return showWarning(localizations.error_password_length);
    }

    await onRequest(
      event: service.registerUser(
        email: email.value!.trim(),
        name: name.value!.trim(),
        password: password.value!,
        telefone: "$countryCode${telefone.value ?? ''}",
      ),
      onSuccess: (value) {
        this.navigator.navigateToLoginPage();
        cleanFields([email, name, telefone, password]);
        showSuccess(value.message!);

        navigateToLoginPage();
      },
      onError: (error) {
        showError(error.errorMessage);
      },
    );
  }

  @override
  navigateToLoginPage() {
    this.navigator.navigateToLoginPage();
  }

  @override
  void setEmail(String? value) {
    setFieldChange(email, value);
    loger.info('Email é $email');
  }

  @override
  void setPassword(String? value) {
    setFieldChange(password, value);
    loger.info('Password é $password');
  }

  @override
  void setName(String? value) {
    setFieldChange(name, value);
    loger.info('Nome é $name');
  }

  @override
  void setPhoneNumer(String? value) {
    setFieldChange(telefone, value);
    loger.info('Telefone é $telefone');
  }

  @override
  void dispose() {
   emailFocusNode.dispose();
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }
}
