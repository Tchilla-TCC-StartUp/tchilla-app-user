import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/headerpage.dart';
import 'package:tchilla/viewmodel/forenge_password_viewmodel.dart';

class ForengePassswordAuthEmailPage extends StatefulWidget {
  const ForengePassswordAuthEmailPage({super.key});

  @override
  State<ForengePassswordAuthEmailPage> createState() =>
      _ForengePassswordAuthEmailPageState();
}

class _ForengePassswordAuthEmailPageState
    extends State<ForengePassswordAuthEmailPage> {
  final FocusNode emailFocus = FocusNode();
  final viewmodel = Modular.get<ForengePasswordViewmodel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
      ),
      body: AppLayoutpage(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Headerpage(
            title: "Esqueceu sua senha?",
            description: "Digite seu email para recuperar a senha",
          ),
          AppGlobalInput(
            helpText: "Endereço de email",
            hintText: "celson.paixao@gmail.com",
            focusNode: emailFocus,
            keyboardType: TextInputType.emailAddress,
          ),
          AppGlobalVericalSpacing(
            value: 3.h,
          ),
          AppGlobalTextButton(
            minWidth: 100.w,
            onPressed: viewmodel.navigateToToConfirmationPage,
            textButton: "Confirmar",
          )
        ],
      )),
    );
  }
}
