import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
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
import 'package:tchilla/viewmodel/login_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode emailFocusNode = FocusNode();
  final emailController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final viewmodel = Get.find<LoginViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: AppLayoutpage(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppAnimationLogo(
              focusNode: [
                emailFocusNode,
                passwordFocusNode,
              ],
            ),
            AppGlobalText(
              text: AppLocalizations.of(context)!.sign_in,
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
                  helpText: AppLocalizations.of(context)!.email_address,
                  hintText: "celson.paixao@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                const AppGlobalVericalSpacing(),
                GestureDetector(
                  onTap: viewmodel.navigateToForengePasswordPage,
                  child: AppGlobalText(
                    text: AppLocalizations.of(context)!.forgot_password,
                    style: TextStyleEnum.p_normal,
                    color: primary500,
                  ),
                )
              ],
            ),
            const AppGlobalVericalSpacing(),
            AppGlobalInput(
              focusNode: passwordFocusNode,
              helpText: AppLocalizations.of(context)!.password,
              controller: passwordController,
              hintText: "*******",
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
              obscureText: true,
              onFieldSubmitted: (value) => viewmodel.login(
                emailController.text,
                passwordController.text,
              ),
            ),
            AppGlobalVericalSpacing(
              value: 6.h,
            ),
            AppGlobalTextButton(
              minWidth: 100.w,
              onPressed: () => viewmodel.login(
                emailController.text,
                passwordController.text,
              ),
              textButton: AppLocalizations.of(context)!.login,
            ),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            AppAuthDivider(text: AppLocalizations.of(context)!.or_you_can_also),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            AppGlobalImageButton(
              minWidth: 100.w,
              color: primary300.withOpacity(.5),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssetsImages.googleLogoSvg,
                    width: 30.px,
                    height: 30.px,
                  ),
                  const AppGlobalHorizontalSpacing(),
                  AppGlobalText(
                    text: AppLocalizations.of(context)!.sign_up_with_google,
                    style: TextStyleEnum.p_normal,
                    color: gray600,
                  )
                ],
              ),
            ),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: viewmodel.navigateToRegisterPage,
                child: AppGlobalText(
                  text: AppLocalizations.of(context)!.create_account_button,
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
