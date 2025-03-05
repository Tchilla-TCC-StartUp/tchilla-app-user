import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/repository/events/user_repository.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel {
  LoginViewmodel({
    required this.repository,
  });

  final UserRepository repository;

  Future<void> navigateToRegisterPage() {
    return navigator.navigateToRegisterPage();
  }

  login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      loger.info("Campos vazios detectados");
      return showWarning(
        AppLocalizations.of(context)!.login_required_fields,
      );
    }

    if (!validator.validatEmail(email)) {
      loger.info("Email inválido");
      return showWarning(
        AppLocalizations.of(context)!.login_invalid_email,
      );
    }

    if (password.length < 6) {
      loger.info("Senha curta");
      return showWarning(
        AppLocalizations.of(context)!.login_password_length,
      );
    }

    await request(
      event: repository.authUser(email: email, password: password),
      onSuccess: (value) async {
        await dataToken.saveToken(value.data!);
        navigator.navigateToHome();
      },
      onError: (value) {
        showError(value.errorMessage);
      },
    );
  }

  navigateToForengePasswordPage() {
    navigator.navigateToForengePassewordEmailPage();
  }
}
