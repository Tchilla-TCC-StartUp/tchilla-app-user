import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'package:tchilla/services/events/notificator.dart';
import 'app_bindings.dart';
import 'app_router.dart';
import 'style/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tchilla',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppGetAppRoutes.routes,
      scaffoldMessengerKey: Notificator().snackbarKey,
      initialBinding: AppBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary500),
        useMaterial3: true,
        scaffoldBackgroundColor: primary50,
      ),
    );
  }
}
