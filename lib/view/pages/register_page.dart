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
import 'package:tchilla/view/widgets/app_global_phone_number_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/event/register_viewmodel.dart';

class RegisterPage extends GetView<RegisterViewmodel> {
  const RegisterPage({super.key});

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
                controller.nameFocusNode,
                controller.emailFocusNode,
                controller.passwordFocusNode,
                controller.phoneNumberFocusNode
              ],
            ),
            AppGlobalText(
              text: controller.localizations.sign_up,
              style: TextStyleEnum.h2_bold,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              onChanged: controller.setName,
              focusNode:  controller.nameFocusNode,
              helpText: controller.localizations.name,
              hintText: "Celson Paixão",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              onChanged: controller.setEmail,
              focusNode: controller. emailFocusNode,
              helpText: controller.localizations.email_address,
              hintText: "celson.paixao@gmail.com",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalPhoneNumberInput(
              label: controller.localizations.telephone_number,
              initialCountryCode: '+244',
              textInputAction: TextInputAction.next,
              onCountryCodeChanged: (code) {
                controller.countryCode.value = code;
                print(code);
              },
              onChanged: controller.setPhoneNumer,
              focusNode:  controller.phoneNumberFocusNode,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              onChanged: controller.setPassword,
              focusNode: controller. passwordFocusNode,
              helpText: controller.localizations.password,
              hintText: "*******",
              inputType: AppInputType.password,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (v) => controller.register,
              obscureText: true,
            ),
            AppGlobalVericalSpacing(
              value: 6.h,
            ),
            Obx(
              () => AppGlobalTextButton(
                minWidth: 100.w,
                isLoading: controller.isLoading.value,
                onPressed: controller.register,
                textButton: controller.localizations.create_account_button,
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
            //         text: controller.localizations.sign_up_with_google,
            //         style: TextStyleEnum.p_normal,
            //         color: gray600,
            //       ),
            //     ],
            //   ),
            // ),
            // AppGlobalVericalSpacing(
            //   value: 2.h,
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppGlobalText(
                  text: controller.localizations.already_have_account,
                  style: TextStyleEnum.p_medium,
                  color: gray600,
                ),
                const AppGlobalHorizontalSpacing(),
                GestureDetector(
                  onTap: controller.navigateToLoginPage,
                  child: AppGlobalText(
                    text: controller.localizations.login_here,
                    style: TextStyleEnum.p_medium,
                    color: primary500,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
