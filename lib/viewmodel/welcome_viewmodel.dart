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

  void getWelcomeData() async {
    await request(
      event: repository.fetchWelcomeData(lang),
      onSuccess: (value) {
        _welcomeData.value = value;
      },
    );

    lastRequest.value = getWelcomeData;
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
