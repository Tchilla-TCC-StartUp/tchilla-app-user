import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/app_global_border_button.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/onboarding_body.dart';
import 'package:tchilla/view/widgets/tchilla_animation_loading.dart';
import 'package:tchilla/viewmodel/event/welcome_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final viewmodel = Get.find<WelcomeViewmodel>();

  @override
  void initState() {
    super.initState();

    viewmodel.getWelcomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AppLayoutpage(
          body: Obx(
            () {
              return viewmodel.isLoading.value
                  ? const TchillaAnimationLoading()
                  : viewmodel.isError.value
                      ? ErrorTryAgain(
                          message: viewmodel.errorMessage.value,
                          event: viewmodel.getWelcomeData,
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
          image: viewmodel.welcomeData?.url ?? "",
          title: viewmodel.welcomeData?.title ?? '',
          description: viewmodel.welcomeData?.description ?? '',
        ),
        AppGlobalVericalSpacing(
          value: 4.h,
        ),
        AppGlobalTextButton(
          minWidth: 100.w,
          onPressed: viewmodel.navigateToRegister,
          textButton: viewmodel.localizations.create_account_button,
        ),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        AppGlobalBorderButton(
          minWidth: 100.w,
          textButton: viewmodel.localizations.login,
          onPressed: viewmodel.navigateToLogin,
        ),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
        GestureDetector(
          onTap: viewmodel.enterAsVisitor,
          child: AppGlobalText(
            text: viewmodel.localizations.guest_login,
            style: TextStyleEnum.h3_bold,
          ),
        )
      ],
    );
  }
}
