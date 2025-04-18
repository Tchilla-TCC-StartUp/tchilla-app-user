import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/viewmodel/event/splash_viewmodel.dart';

class SplashPage extends GetView<SplashViewmodel> {
  const SplashPage({super.key});

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
                return controller.isConnected.value
                    ? Stack(
                        children: [
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.sp),
                              child: Image.asset(
                                AppAssetsImages.logotipoPng,
                                width: getAdaptativeWidth(70.w, 50.w, 30.w),
                                height: getAdaptativeHeight(35.h, 25.h, 15.h),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppGlobalText(
                                  text:
                                      "${controller.localizations.version}: Alpha${controller.appVersion}",
                                  style: TextStyleEnum.p_medium),
                            ),
                          )
                        ],
                      )
                    : ErrorTryAgain(
                        message: controller.localizations.noInternetConnection,
                        event: controller.firstNavigation,
                      );
              },
            )));
  }
}
