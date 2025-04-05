import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/headerpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../viewmodel/forgont_password_viewmodel.dart';

class RedefinePasswordPage extends StatefulWidget {
  final String previousWalk;
  const RedefinePasswordPage({super.key, required this.previousWalk});

  @override
  State<RedefinePasswordPage> createState() => _RedefinePasswordPageState();
}

class _RedefinePasswordPageState extends State<RedefinePasswordPage> {
  final viewmodel = Get.find<ForgontPasswordViewmodel>();
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
            Headerpage(
              title: viewmodel.localizations.reset_password,
              description:
                  viewmodel.localizations.reset_password_description,
            ),
            AppGlobalInput(
              helpText: viewmodel.localizations.password,
              hintText: "***********",
              keyboardType: TextInputType.visiblePassword,
              controller: passordController,
              obscureText: true,
              textInputAction: TextInputAction.next,
            ),
            AppGlobalVericalSpacing(
              value: 2.h,
            ),
            AppGlobalInput(
              helpText: viewmodel.localizations.confirm_password,
              hintText: "***********",
              keyboardType: TextInputType.visiblePassword,
              controller: confirmPassordController,
              obscureText: true,
              textInputAction: TextInputAction.send,
              onFieldSubmitted: (p0) {
                viewmodel.resetPassword(
                  passordController.text,
                  confirmPassordController.text,
                  context,
                  widget.previousWalk,
                );
              },
            ),
            AppGlobalVericalSpacing(
              value: 4.h,
            ),
            AppGlobalTextButton(
              minWidth: 100.w,
              onPressed: () {
                viewmodel.resetPassword(
                  passordController.text,
                  confirmPassordController.text,
                  context,
                  widget.previousWalk,
                );
              },
              textButton: viewmodel.localizations.redefine,
            )
          ],
        )),
      ),
    );
  }
}
