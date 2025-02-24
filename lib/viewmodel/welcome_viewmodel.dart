import 'package:get/get.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/repository/events/welcome_repository.dart';
import 'package:tchilla/services/events/navigation.dart';


class WelcomeViewmodel extends GetxController {
  final Navigation navigator;
  final WelcomeRepository repository;

  final Rxn<WelcomeModel> _welcomeData = Rxn<WelcomeModel>();

  WelcomeViewmodel({
    required this.navigator,
    required this.repository,
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
    navigator.navigateToLoginPage();
  }

  void navigateToRegister() {
    navigator.navigateToRegisterPage();
  }

  void enterAsVisitor() {
    navigator.navigateToHome();
  }
}
