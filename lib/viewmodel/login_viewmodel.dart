import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:tchilla/repository/events/user_repository.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel {
  LoginViewmodel({
    required this.repository,
  });

  final UserRepository repository;

  final Rxn<String?> email = Rxn<String?>();
  final Rxn<String?> password = Rxn<String?>();

  Future<void> navigateToRegisterPage() {
    return this.navigator.navigateToRegisterPage();
  }

  login() async {
    if (email.value!.isEmpty || password.value!.isEmpty) {
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
      return showWarning(
        AppLocalizations.of(context)!.login_password_length,
      );
    }

    await onRequest(
      event:
          repository.authUser(email: email.value!, password: password.value!),
      onSuccess: (value) async {
        await dataToken.saveToken(value.data!);
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
}
