import 'package:flutter_modular/flutter_modular.dart';
import 'package:tchilla/util/interface/inavigation.dart';
import 'package:tchilla/resources/app_routers.dart' as Router;

class Navigation extends INavigation {
  final modular = Modular;
  @override
  Future<void> navigateToHome() {
    return modular.to
        .pushNamedAndRemoveUntil(Router.homePage, (route) => false);
  }
}
