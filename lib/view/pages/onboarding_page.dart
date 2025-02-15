import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_image_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/viewmodel/onboarding_viewmodel.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.find<OnboardingViewModel>();

    final onboardingList = [
      OnboardingBody(
        image: AppAssetsImages.onboardingImage1,
        title: "Economize tempo na sua busca.",
        description:
            "Com apenas alguns cliques, encontre o local ideal para qualquer evento social com as melhores opções do mercado, eliminando as dores de cabeça na procura.",
      ),
      OnboardingBody(
        image: AppAssetsImages.onboardingImage2,
        title: "Serviços de Decoração no Pacote",
        description:
            "Tudo o que você precisa para um ambiente único e encantador! Nosso pacote inclui serviços de decoração personalizados para tornar seu espaço inesquecível.",
      ),
      OnboardingBody(
        image: AppAssetsImages.onboardingImage3,
        title: "Agende, Realize, Avalie com Confiança.",
        description:
            "Com poucos toques, agende os serviços que precisa, acompanhe a execução e avalie a experiência com total transparência. Confiança e qualidade na palma da sua mão!",
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: AppLayoutpage(
          body: Column(
            children: [
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: viewModel.clickSkip,
                  child: AppGlobalText(
                    text: "Pular",
                    style: TextStyleEnum.h3_medium,
                  ),
                ),
              ),
              AppGlobalVericalSpacing(
                value: 4.h,
              ),
              Expanded(
                child: PageView.builder(
                  controller: viewModel.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    viewModel.currentPage.value = index;
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (context, index) {
                    return onboardingList[index];
                  },
                ),
              ),
              SmoothPageIndicator(
                controller: viewModel.pageController,
                count: onboardingList.length,
                effect: ExpandingDotsEffect(
                  dotColor: gray400,
                  activeDotColor: primary950,
                  dotWidth: 2.w,
                  dotHeight: 1.h,
                ),
              ),
              AppGlobalVericalSpacing(
                value: 10.h,
              ),
              AppGlobalImageButton(
                  onPressed: viewModel.nextPage,
                  color: primary950,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppGlobalText(
                        text: "Prosseguir",
                        color: primary50,
                        style: TextStyleEnum.h3_bold,
                      ),
                      const AppGlobalHorizontalSpacing(),
                      SvgPicture.asset(AppAssetsImages.arrowRightSvg)
                    ],
                  )),
              AppGlobalVericalSpacing(
                value: 6.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
