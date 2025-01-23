import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:get/get.dart'; // Import necessário para o GetX
import 'app_gets.dart'; // Importe a classe AppGets
import 'app_router.dart'; // Importe a classe AppRouter
import 'style/colors.dart'; // Importe as cores

void main() {
  final appRouter = AppRouter();
  AppGets.init(appRouter.router);

  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MyApp(router: appRouter.router);
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tchilla',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary500),
        useMaterial3: true,
      ),
    );
  }
}
