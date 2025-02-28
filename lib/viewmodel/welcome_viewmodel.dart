import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';

class WelcomeViewmodel extends BaseViewModel {
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

  Future<void> fetchWelcomeData(BuildContext context) async {
    try {
      final lang = Get.deviceLocale?.languageCode ?? "en";
      startLoading();
      final data = await repository.fetchWelcomeData(lang);
      loger.info("Dados do welcome carregados com sucesso.");
      _welcomeData.value = data;
    } catch (e) {
      emitError(e.toString());
    } finally {
      stopLoading();
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
