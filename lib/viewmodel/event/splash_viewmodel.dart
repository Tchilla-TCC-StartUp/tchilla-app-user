import 'package:get/get.dart';
import 'package:tchilla/services/events/conectivity_service.dart';
import 'package:tchilla/viewmodel/interface/isplash_viewmodel.dart';

class SplashViewmodel extends ISplashViewmodel {
  RxBool _isConnected = true.obs;
  RxBool get isConnected => _isConnected;
  final ConectivityService conectivityService;

  SplashViewmodel({required this.conectivityService});
  @override
  void firstNavigation() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      _isConnected.value = await conectivityService.isConnectedToInternet();
      loger.info("User está conectado: ${_isConnected.value}");

      if (_isConnected.value) {
        await onEvent(
          checkLogin: true,
          event: (_) async => await this.navigator.navigateToHome(),
          onErrorAuth: () async => await this.navigator.navigateToOnboarding(),
        );
      }
    } catch (e) {
      loger.printError(info: "Erro ao verificar conexão: $e");
      showError(e);
    }
  }
}
