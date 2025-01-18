import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/viewmodel/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final SplashViewmodel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = Modular.get<SplashViewmodel>();
    viewmodel.navigateToHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8.sp),
            child: Image.asset(
              logotipoPng,
              width: getAdaptativeWidth(70.w, 50.w, 30.w),
              height: getAdaptativeHeight(35.h, 25.h, 15.h),
            ),
          ),
        ),
      ),
    );
  }
}
