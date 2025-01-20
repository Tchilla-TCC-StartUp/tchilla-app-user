import 'package:flutter_modular/flutter_modular.dart';

final String initialRoute = Modular.initialRoute;

final String mainRouter = "${initialRoute}main";

final String homePage = "$mainRouter/home";
final String loginPage = "$mainRouter/login";
final String registerPage = "$mainRouter/register";
final String forengePassswordEmail =
    "$mainRouter/forange_passsword/auth_email_page";
final String forengePassswordConfirmationPin =
    "$forengePassswordEmail/forange_passsword/confirmation_pin";

final String redefinePasswordPage =
    "$forengePassswordConfirmationPin/redefinePasswordPage";
