import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/app_module.dart';
import 'package:tchilla/style/colors.dart';

void main() {
  runApp(ResponsiveSizer(
    builder: (context, orientation, screenType) {
      return ModularApp(
        module: AppModule(),
        child: const MyApp(),
      );
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tchilla',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary500),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}

