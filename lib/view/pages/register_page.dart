import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_constats.dart';
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
  final viewmodel = Get.find<RegisterViewmodel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppLayoutpage(
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
              text: "Fazer Cadastro",
              style: TextStyleEnum.h2_bold,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              focusNode: nameFocusNode,
              helpText: "Nome",
              hintText: "Celson Paixão",
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              focusNode: emailFocusNode,
              helpText: "Endereco de email",
              hintText: "celson.paixao@gmail.com",
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              focusNode: passwordFocusNode,
              helpText: "Senha",
              hintText: "*******",
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
            ),
            AppGlobalVericalSpacing(
              value: 6.h,
            ),
            AppGlobalTextButton(
              minWidth: 100.w,
              onPressed: viewmodel.navigateToLoginPage,
              textButton: "Criar Conta",
            ),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            const AppAuthDivider(text: "Ou tembém\npode"),
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
                    googlelogoSvg,
                    width: 30.px,
                    height: 30.px,
                  ),
                  const AppGlobalHorizontalSpacing(),
                  AppGlobalText(
                    text: "Cadastrar com o Google",
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
                  text: "Ja tem uma conta?",
                  style: TextStyleEnum.p_medium,
                  color: gray600,
                ),
                const AppGlobalHorizontalSpacing(),
                GestureDetector(
                  onTap: viewmodel.navigateToLoginPage,
                  child: AppGlobalText(
                    text: "Faca login aqui",
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
