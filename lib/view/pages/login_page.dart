import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_animation_logo.dart';
import 'package:tchilla/view/widgets/app_auth_divider.dart';
import 'package:tchilla/view/widgets/app_global_image_button.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/event/login_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final viewmodel = Get.find<LoginViewmodel>();

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: AppLayoutpage(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppAnimationLogo(
                focusNode: [
                  emailFocusNode,
                  passwordFocusNode,
                ],
              ),
              AppGlobalText(
                text: viewmodel.localizations.sign_in,
                style: TextStyleEnum.h2_bold,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppGlobalInput(
                    focusNode: emailFocusNode,
                    helpText: viewmodel.localizations.email_address,
                    hintText: "celson.paixao@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                    onChanged: viewmodel.setEmail,
                    textInputAction: TextInputAction.next,
                  ),
                  const AppGlobalVericalSpacing(),
                  GestureDetector(
                    onTap: viewmodel.navigateToForengePasswordPage,
                    child: AppGlobalText(
                      text: viewmodel.localizations.forgot_password,
                      style: TextStyleEnum.p_normal,
                      color: primary500,
                    ),
                  )
                ],
              ),
              const AppGlobalVericalSpacing(),
              AppGlobalInput(
                focusNode: passwordFocusNode,
                helpText: viewmodel.localizations.password,
                hintText: "*******",
                inputType: AppInputType.password,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.send,
                obscureText: true,
                onChanged: viewmodel.setPassword,
                onFieldSubmitted: (value) => viewmodel.login(),
              ),
              AppGlobalVericalSpacing(
                value: 6.h,
              ),
              Obx(
                () => AppGlobalTextButton(
                  minWidth: 100.w,
                  isLoading: viewmodel.isLoading.value,
                  onPressed: viewmodel.login,
                  textButton: viewmodel.localizations.login,
                ),
              ),
              AppGlobalVericalSpacing(
                value: 3.h,
              ),
              AppAuthDivider(
                  text: viewmodel.localizations.or_you_can_also),
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
                  onTap: viewmodel.navigateToRegisterPage,
                  child: AppGlobalText(
                    text: viewmodel.localizations.create_account_button,
                    style: TextStyleEnum.h3_bold,
                    color: primary500,
                    align: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
