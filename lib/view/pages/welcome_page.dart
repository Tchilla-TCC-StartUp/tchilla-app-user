import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/shimmers/welcome_shimmer.dart';
import 'package:tchilla/view/widgets/app_global_border_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/viewmodel/event/welcome_viewmodel.dart';

class WelcomePage extends GetView<WelcomeViewmodel> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayoutpage(
          body: Obx(
            () {
              return controller.isLoading.value
                  ? const WelcomeShimmer()
                  : controller.isError.value
                      ? ErrorTryAgain(
                          message: controller.errorMessage.value,
                          event: controller.getWelcomeData,
                        )
                      : _buildBody(context);
            },
          ),
        ),
      ),
    );
  }

  Column _buildBody(BuildContext context) {
    return Column(
      children: [
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        OnboardingBody(
          image: controller.welcomeData?.url ?? "",
          title: controller.welcomeData?.title ?? '',
          description: controller.welcomeData?.description ?? '',
        ),
        AppGlobalVericalSpacing(
          value: 4.h,
        ),
        AppGlobalTextButton(
          minWidth: 100.w,
          onPressed: controller.navigateToRegister,
          textButton: controller.localizations.create_account_button,
        ),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        AppGlobalBorderButton(
          minWidth: 100.w,
          textButton: controller.localizations.login,
          onPressed: controller.navigateToLogin,
        ),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        GestureDetector(
          onTap: controller.enterAsVisitor,
          child: AppGlobalText(
            text: controller.localizations.guest_login,
            style: TextStyleEnum.h3_bold,
          ),
        )
      ],
    );
  }
}
