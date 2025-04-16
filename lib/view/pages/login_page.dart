import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_animation_logo.dart';
import 'package:tchilla/view/widgets/app_auth_divider.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/event/login_viewmodel.dart';

class LoginPage extends GetView<LoginViewmodel> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppGlobalBackButton(onTap: controller.navigator.navigateToWelcomePage,),
      ),
        body: AppLayoutpage(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppAnimationLogo(
                  focusNode: [
                    controller.emailFocusNode,
                    controller.passwordFocusNode,
                  ],
                ),
                AppGlobalText(
                  text: controller.localizations.sign_in,
                  style: TextStyleEnum.h2_bold,
                ),
                AppGlobalVericalSpacing(
                  value: 2.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppGlobalInput(
                      focusNode: controller.emailFocusNode,
                      helpText: controller.localizations.email_address,
                      hintText: "celson.paixao@gmail.com",
                      keyboardType: TextInputType.emailAddress,
                      onChanged: controller.setEmail,
                      textInputAction: TextInputAction.next,
                    ),
                    const AppGlobalVericalSpacing(),
                    GestureDetector(
                      onTap: controller.navigateToForengePasswordPage,
                      child: AppGlobalText(
                        text: controller.localizations.forgot_password,
                        style: TextStyleEnum.p_normal,
                        color: primary500,
                      ),
                    )
                  ],
                ),
                const AppGlobalVericalSpacing(),
                AppGlobalInput(
                  focusNode: controller.passwordFocusNode,
                  helpText: controller.localizations.password,
                  hintText: "*******",
                  inputType: AppInputType.password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.send,
                  obscureText: true,
                  onChanged: controller.setPassword,
                  onFieldSubmitted: (value) => controller.login(),
                ),
                AppGlobalVericalSpacing(
                  value: 6.h,
                ),
                Obx(
                  () => AppGlobalTextButton(
                    minWidth: 100.w,
                    isLoading: controller.isLoading.value,
                    onPressed: controller.login,
                    textButton: controller.localizations.login,
                  ),
                ),
                AppGlobalVericalSpacing(
                  value: 3.h,
                ),
                AppAuthDivider(text: controller.localizations.or_you_can_also),
                AppGlobalVericalSpacing(
                  value: 3.h,
                ),
                // AppGlobalImageButton(
                //   minWidth: 100.w,
                //   color: primary300.withOpacity(.5),
                //   onPressed: () {},
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SvgPicture.asset(
                //         AppAssetsImages.googleLogoSvg,
                //         width: 30.px,
                //         height: 30.px,
                //       ),
                //       const AppGlobalHorizontalSpacing(),
                //       AppGlobalText(
                //         text: viewmodel.localizations.sign_up_with_google,
                //         style: TextStyleEnum.p_normal,
                //         color: gray600,
                //       )
                //     ],
                //   ),
                // ),
                // AppGlobalVericalSpacing(
                //   value: 3.h,
                // ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: controller.navigateToRegisterPage,
                    child: AppGlobalText(
                      text: controller.localizations.create_account_button,
                      style: TextStyleEnum.h3_bold,
                      color: primary500,
                      align: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
