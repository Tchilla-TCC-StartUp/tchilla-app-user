import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/headerpage.dart';

import '../../viewmodel/event/forgont_password_viewmodel.dart';

class RedefinePasswordPage extends GetView<ForgontPasswordViewmodel> {
  final String previousWalk;
  const RedefinePasswordPage({super.key, required this.previousWalk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
      ),
      body: SafeArea(
        child: AppLayoutpage(
            body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headerpage(
                title: controller.localizations.reset_password,
                description: controller.localizations.reset_password_description,
              ),
              AppGlobalInput(
                helpText: controller.localizations.old_password,
                hintText: "***********",
                keyboardType: TextInputType.visiblePassword,
                onChanged: controller.setOldPassword,
                inputType: AppInputType.password,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                helpText: controller.localizations.new_password,
                hintText: "***********",
                inputType: AppInputType.password,
                keyboardType: TextInputType.visiblePassword,
                onChanged: controller.setNewPassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                helpText: controller.localizations.confirm_new_password,
                hintText: "***********",
                inputType: AppInputType.password,
                keyboardType: TextInputType.visiblePassword,
                onChanged: controller.setConfirmNewPassword,
                obscureText: true,
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (p0) {
                  controller.resetPassword(
                    previousWalk,
                  );
                },
              ),
              AppGlobalVericalSpacing(
                value: 4.h,
              ),
              Obx(
                () => AppGlobalTextButton(
                  minWidth: 100.w,
                  isLoading: controller.isLoading.value,
                  onPressed: () {
                    controller.resetPassword(
                      previousWalk,
                    );
                  },
                  textButton: controller.localizations.redefine,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

}

