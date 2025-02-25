import 'package:get/get.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:tchilla/services/events/navigation.dart';
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

  Future<void> fetchWelcomeData(String lang) async {
    try {
      final data = await repository.fetchWelcomeData(lang);
      _welcomeData.value = data;
    } catch (e) {
      print("Erro ao buscar os dados de boas-vindas: $e");
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
