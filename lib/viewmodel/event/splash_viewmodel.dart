import 'package:tchilla/services/events/conectivity_service.dart';
import 'package:tchilla/viewmodel/base_viewmodel.dart';
import 'package:tchilla/viewmodel/interface/isplash_viewmodel.dart';

class SplashViewmodel extends ISplashViewmodel {
  final ConectivityService conectivityService;

  SplashViewmodel({required this.conectivityService});
  @override
  void firstNavigation() async {
    try {
      bool connected = await conectivityService.isConnectedToInternet();
      loger.info("User está conectado: $connected");
      await Future.delayed(const Duration(seconds: 2));

      if (connected) {
        await onEvent(
          checkLogin: true,
          event: (_) async => await navigator.navigateToHome(),
          onErrorAuth: () async => await navigator.navigateToOnboarding(),
        );
      } else {
        showError("Usuário não está conectado à internet.");
      }
    } catch (e) {
      loger.printError(info: "Erro ao verificar conexão: $e");
      showError("Ocorreu um erro ao verificar a conexão.");
    }
  }
}
