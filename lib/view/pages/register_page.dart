import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_animation_logo.dart';
import 'package:tchilla/view/widgets/app_auth_divider.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/register_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/app_global_image_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final viewmodel = Get.find<RegisterViewmodel>();
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
                nameFocusNode,
                emailFocusNode,
                passwordFocusNode,
              ],
            ),
            AppGlobalText(
              text: AppLocalizations.of(context)!.sign_up,
              style: TextStyleEnum.h2_bold,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              controller: nameController,
              focusNode: nameFocusNode,
              helpText: AppLocalizations.of(context)!.name,
              hintText: "Celson Paixão",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              controller: emailController,
              focusNode: emailFocusNode,
              helpText: AppLocalizations.of(context)!.email_address,
              hintText: "celson.paixao@gmail.com",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              controller: passwordController,
              focusNode: passwordFocusNode,
              helpText: AppLocalizations.of(context)!.password,
              hintText: "*******",
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (p0) => viewmodel.register(
                nameController.text,
                emailController.text,
                passwordController.text,
              ),
              obscureText: true,
            ),
            AppGlobalVericalSpacing(
              value: 6.h,
            ),
            AppGlobalTextButton(
              minWidth: 100.w,
              onPressed: () => viewmodel.register(
                nameController.text,
                emailController.text,
                passwordController.text,
              ),
              textButton: AppLocalizations.of(context)!.create_account_button,
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
                  ),
                ],
              ),
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppGlobalText(
                  text: AppLocalizations.of(context)!.already_have_account,
                  style: TextStyleEnum.p_medium,
                  color: gray600,
                ),
                const AppGlobalHorizontalSpacing(),
                GestureDetector(
                  onTap: viewmodel.navigateToLoginPage,
                  child: AppGlobalText(
                    text: AppLocalizations.of(context)!.login_here,
                    style: TextStyleEnum.p_medium,
                    color: primary500,
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
