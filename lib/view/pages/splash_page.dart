import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/viewmodel/event/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final viewmodel = Get.find<SplashViewmodel>();

  @override
  void initState() {
    super.initState();
    viewmodel.firstNavigation();
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
          body: Obx(
            () {
              return viewmodel.isConnected.value
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: Image.asset(
                          AppAssetsImages.logotipoPng,
                          width: getAdaptativeWidth(70.w, 50.w, 30.w),
                          height: getAdaptativeHeight(35.h, 25.h, 15.h),
                        ),
                      ),
                    )
                  : ErrorTryAgain(
                      message: viewmodel.localizations.noInternetConnection,
                      event: viewmodel.firstNavigation,
                    );
            },
          )),
    );
  }
}
