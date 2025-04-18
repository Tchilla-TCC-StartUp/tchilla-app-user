import 'package:get/get.dart';
import 'package:tchilla/model/welcome_model.dart';
import 'package:tchilla/services/events/welcome_service.dart';
import 'package:tchilla/viewmodel/interface/iwelcome_viewmodel.dart';

class WelcomeViewmodel extends IWelcomeViewmodel {
  final WelcomeService service;
  final Rxn<WelcomeModel> _welcomeData = Rxn<WelcomeModel>();

  WelcomeViewmodel({required this.service});
  WelcomeModel? get welcomeData => _welcomeData.value;

  @override
  void onInit() {
    super.onInit();
    getWelcomeData();
  }

  @override
  void getWelcomeData() async {
    await onRequest(
      event: service.fetchWelcomeData(lang),
      onSuccess: (value) {
        _welcomeData.value = value;
      },
    );
  }

  @override
  void navigateToLogin() {
    onEvent(event: (_) async {
      await this.navigator.navigateToLoginPage();
    });
  }

  @override
  void navigateToRegister() {
    onEvent(event: (_) async {
      await this.navigator.navigateToRegisterPage();
    });
  }

  @override
  void enterAsVisitor() async {
    await onEvent(
      event: (_) async {
        await this.navigator.navigateToHome();
      },
    );
  }
}
