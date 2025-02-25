import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class WelcomeViewmodel extends BaseViewlmodel {
  final WelcomeRepository repository;

  final Rxn<WelcomeModel> _welcomeData = Rxn<WelcomeModel>();

  WelcomeViewmodel({
    required this.repository,
    required super.notificator,
    required super.validator,
    required super.navigator,
    required super.loger,
  });

  WelcomeModel? get welcomeData => _welcomeData.value;

  Future<void> fetchWelcomeData(String lang, BuildContext context) async {
    try {
      loger.info("Buscando dados do onboarding para o idioma: $lang");
      final data = await repository.fetchWelcomeData(lang);
      loger.info("Dados do welcome carregados com sucesso.");
      loger.printJson(data);
      _welcomeData.value = data;
    } catch (e) {
      loger.error("Erro ao buscar os dados de boas-vindas: $e");
      notificator.showLocalError(
        AppLocalizations.of(context)!.error,
        e.toString(),
        context,
      );
    }
  }

  void navigateToLogin() {
    this.navigator.navigateToLoginPage();
  }

  void navigateToRegister() {
    this.navigator.navigateToRegisterPage();
  }

  void enterAsVisitor() {
    this.navigator.navigateToHome();
  }
}
