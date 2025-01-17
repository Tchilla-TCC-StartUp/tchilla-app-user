import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;
import 'package:tchilla/view/pages/splash_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child(
      Router.initialRoute,
      child: (context) => const SplashPage(),
    );
  }
}
