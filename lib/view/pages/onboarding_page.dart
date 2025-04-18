import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/shimmers/welcome_shimmer.dart';
import 'package:tchilla/view/widgets/app_global_image_button.dart';
import 'package:tchilla/view/widgets/app_global_page_indicator.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/viewmodel/event/onboarding_viewmodel.dart';

class OnboardingPage extends GetView<OnboardingViewModel> {
  const OnboardingPage({super.key});

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
                          event: controller.onInit,
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
          value: 2.h,
        ),
        Visibility(
          visible: controller.currentPage.value < 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: controller.clickSkip,
              child: AppGlobalText(
                text: controller.localizations.skip,
                style: TextStyleEnum.h3_medium,
              ),
            ),
          ),
        ),
        AppGlobalVericalSpacing(
          value: 4.h,
        ),
        Expanded(
          child: Obx(() {
            return PageView.builder(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                controller.currentPage.value = index;
              },
              itemCount: controller.onboarding.length,
              itemBuilder: (context, index) {
                var item = controller.onboarding[index];
                return OnboardingBody(
                  image: item.url!,
                  title: item.title!,
                  description: item.description!,
                );
              },
            );
          }),
        ),
        AppGlobalPageIndicator(
          controller: controller.pageController,
          count: controller.onboarding.length,
        ),
        AppGlobalVericalSpacing(
          value: 5.h,
        ),
        AppGlobalImageButton(
            onPressed: controller.nextPage,
            color: primary950,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppGlobalText(
                  text: controller.localizations.proceed,
                  color: primary50,
                  style: TextStyleEnum.h3_bold,
                ),
                const AppGlobalHorizontalSpacing(),
                SvgPicture.asset(AppAssetsImages.arrowRightSvg)
              ],
            )),
        AppGlobalVericalSpacing(
          value: 8.h,
        )
      ],
    );
  }
}
