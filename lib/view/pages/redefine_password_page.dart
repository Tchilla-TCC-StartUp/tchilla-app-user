import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/headerpage.dart';
import 'package:tchilla/viewmodel/forenge_password_viewmodel.dart';

class RedefinePasswordPage extends StatefulWidget {
  const RedefinePasswordPage({super.key});

  @override
  State<RedefinePasswordPage> createState() => _RedefinePasswordPageState();
}

class _RedefinePasswordPageState extends State<RedefinePasswordPage> {
  final viewmodel = Get.find<ForengePasswordViewmodel>();
  final passordController = TextEditingController();
  final confirmPassordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
      ),
      body: SafeArea(
        child: AppLayoutpage(
            body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Headerpage(
              title: "Redefinir senha",
              description:
                  "Redefina sua senha com uma mais segura\n e facil de lembrar",
            ),
            AppGlobalInput(
              helpText: "Senha",
              hintText: "***********",
              keyboardType: TextInputType.visiblePassword,
              controller: passordController,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              helpText: "Confirmar senha ",
              hintText: "***********",
              keyboardType: TextInputType.visiblePassword,
              controller: confirmPassordController,
            ),
            AppGlobalVericalSpacing(
              value: 4.h,
            ),
            AppGlobalTextButton(
              minWidth: 100.w,
              onPressed: () {
                viewmodel.resetPassord(
                  passordController.text,
                  confirmPassordController.text,
                  context,
                );
              },
              textButton: "Redefinir",
            )
          ],
        )),
      ),
    );
  }
}
