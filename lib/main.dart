import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_routes.dart';
import 'app_gets.dart';
import 'app_router.dart';
import 'style/colors.dart';

void main() {
  AppGets.init();
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tchilla',
      initialRoute: AppRoutes.initialRoute,
      getPages: AppGetAppRoutes.routes,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary500),
        useMaterial3: true,
        scaffoldBackgroundColor: primary50,
      ),
    );
  }
}
