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
import 'package:tchilla/view/widgets/app_global_phone_number_input.dart';
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
  final FocusNode phoneNumberFocusNode = FocusNode();

  final viewmodel = Get.find<RegisterViewmodel>();

  @override
  void dispose() {
    emailFocusNode.dispose();
    nameFocusNode.dispose();
    passwordFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

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
                  nameFocusNode,
                  emailFocusNode,
                  passwordFocusNode,
                  phoneNumberFocusNode
                ],
              ),
              AppGlobalText(
                text: viewmodel.localizations.sign_up,
                style: TextStyleEnum.h2_bold,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                onChanged: viewmodel.setName,
                focusNode: nameFocusNode,
                helpText: viewmodel.localizations.name,
                hintText: "Celson Paixão",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                onChanged: viewmodel.setEmail,
                focusNode: emailFocusNode,
                helpText: viewmodel.localizations.email_address,
                hintText: "celson.paixao@gmail.com",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalPhoneNumberInput(
                label: viewmodel.localizations.telephone_number,
                hintText: '923 445 566',
                initialCountryCode: '+244',
                textInputAction: TextInputAction.next,
                onCountryCodeChanged: (code) {
                  viewmodel.countryCode.value = code;
                  print(code);
                },
                onChanged: viewmodel.setPhoneNumer,
                focusNode: phoneNumberFocusNode,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                onChanged: viewmodel.setPassword,
                focusNode: passwordFocusNode,
                helpText: viewmodel.localizations.password,
                hintText: "*******",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (v) => viewmodel.register,
                obscureText: true,
              ),
              AppGlobalVericalSpacing(
                value: 6.h,
              ),
              Obx(
                () => AppGlobalTextButton(
                  minWidth: 100.w,
                  isLoading: viewmodel.isLoading.value,
                  onPressed: viewmodel.register,
                  textButton:
                      viewmodel.localizations.create_account_button,
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
                      text: viewmodel.localizations.sign_up_with_google,
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
                    text: viewmodel.localizations.already_have_account,
                    style: TextStyleEnum.p_medium,
                    color: gray600,
                  ),
                  const AppGlobalHorizontalSpacing(),
                  GestureDetector(
                    onTap: viewmodel.navigateToLoginPage,
                    child: AppGlobalText(
                      text: viewmodel.localizations.login_here,
                      style: TextStyleEnum.p_medium,
                      color: primary500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
