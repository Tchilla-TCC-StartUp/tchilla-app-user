import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_image_button.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final viewmodel = Get.find<OnboardingViewModel>();

  @override
  void initState() {
    super.initState();

    viewmodel.getOnboarding(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayoutpage(
          body: Obx(
            () {
              return viewmodel.isLoading.value
                  ? const AppGlobalLoading()
                  : viewmodel.buildErrorValidatedView(
                      message: viewmodel.errorMessage.value,
                      error: viewmodel.isError.value,
                      tryAgainEvet: ([args]) =>
                          viewmodel.getOnboarding(context),
                      view: _buildBody(context),
                    );
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
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: viewmodel.clickSkip,
            child: AppGlobalText(
              text: AppLocalizations.of(context)!.skip,
              style: TextStyleEnum.h3_medium,
            ),
          ),
        ),
        AppGlobalVericalSpacing(
          value: 4.h,
        ),
        Expanded(
          child: Obx(() {
            return PageView.builder(
              controller: viewmodel.pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                viewmodel.currentPage.value = index;
              },
              itemCount: viewmodel.onboarding.length,
              itemBuilder: (context, index) {
                var item = viewmodel.onboarding[index];
                return OnboardingBody(
                  image: item.url!,
                  title: item.title!,
                  description: item.description!,
                );
              },
            );
          }),
        ),
        SmoothPageIndicator(
          controller: viewmodel.pageController,
          count: viewmodel.onboarding.length,
          effect: ExpandingDotsEffect(
            dotColor: gray400,
            activeDotColor: primary950,
            dotWidth: 2.w,
            dotHeight: 1.h,
          ),
        ),
        AppGlobalVericalSpacing(
          value: 5.h,
        ),
        AppGlobalImageButton(
            onPressed: viewmodel.nextPage,
            color: primary950,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppGlobalText(
                  text: AppLocalizations.of(context)!.proceed,
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
