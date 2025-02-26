import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:tchilla/viewmodel/base_viewlmodel.dart';

class WelcomeViewmodel extends BaseViewlmodel {
  final WelcomeRepository repository;

  final Rxn<WelcomeModel> _welcomeData = Rxn<WelcomeModel>();
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

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
      _isLoading.value = true;
      loger.info("Buscando dados do  welcome para o idioma: $lang");
      final data = await repository.fetchWelcomeData(lang);
      loger.info("Dados do welcome carregados com sucesso.");
      loger.printJson(data);
      _welcomeData.value = data;
    } catch (e, stacktrace) {
      loger.error("Erro ao buscar os dados de boas-vindas: $e");
      handleError(context, e, stacktrace);
    } finally {
      _isLoading.value = false;
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
