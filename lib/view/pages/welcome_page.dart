import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_border_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/viewmodel/welcome_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = Get.find<WelcomeViewmodel>();
    return Scaffold(
      body: SafeArea(
        child: AppLayoutpage(
            body: Column(
          children: [
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            OnboardingBody(
              image: AppAssetsImages.welcomeImage,
              title: AppLocalizations.of(context)!.welcome_title,
              description: AppLocalizations.of(context)!.welcome_description,
            ),
            AppGlobalVericalSpacing(
              value: 4.h,
            ),
            AppGlobalTextButton(
              minWidth: 100.w,
              onPressed: viewmodel.navigateToRegister,
              textButton: AppLocalizations.of(context)!.create_account_button,
            ),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            AppGlobalBorderButton(
              minWidth: 100.w,
              textButton: AppLocalizations.of(context)!.login,
              onPressed: viewmodel.navigateToLogin,
            ),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            GestureDetector(
              child: AppGlobalText(
                text: AppLocalizations.of(context)!.guest_login,
                style: TextStyleEnum.h3_bold,
              ),
              onTap: viewmodel.enteraVisitor,
            )
          ],
        )),
      ),
    );
  }
}
