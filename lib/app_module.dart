import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;
import 'package:tchilla/util/events/navigation.dart';
import 'package:tchilla/view/pages/home_page.dart';
import 'package:tchilla/view/pages/splash_page.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Router.initialRoute,
      child: (context) => const SplashPage(),
      transition: TransitionType.rightToLeft,
    );
    r.child(
      Router.homePage,
      child: (context) => const HomePage(),
      transition: TransitionType.rightToLeft,
    );
  }

  @override
  void binds(Injector i) {
    // Navigation
    i.addLazySingleton<Navigation>(Navigation.new);

    // Viewmodels
    i.addLazySingleton<SplashViewmodel>(SplashViewmodel.new);
  }
}
