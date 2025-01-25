import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_border_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/viewmodel/welcome_viewmodel.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Get.find<WelcomeViewmodel>();
    return Scaffold(
      body: AppLayoutpage(
          body: Column(
        children: [
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          const OnboardingBody(
            image: welconeImage,
            title: "Seja bem vindo ao Tchilla",
            description:
                "Estamos grato por ter baixado o nosso aplicativo, crie conta, faz login, ou explore a App.",
          ),
          AppGlobalVericalSpacing(
            value: 4.h,
          ),
          AppGlobalTextButton(
            minWidth: 100.w,
            onPressed: viewmodel.navigateToRegister,
            textButton: "Crie uma conta",
          ),
          AppGlobalVericalSpacing(
            value: 3.h,
          ),
          AppGlobalBorderButton(
            minWidth: 100.w,
            textButton: "Login",
            onPressed: viewmodel.navigateToLogin,
          ),
          AppGlobalVericalSpacing(
            value: 3.h,
          ),
          GestureDetector(
            child: AppGlobalText(
              text: "Entrar como Visitante",
              style: TextStyleEnum.h3_bold,
            ),
            onTap: viewmodel.enteraVisitor,
          )
        ],
      )),
    );
  }
}
