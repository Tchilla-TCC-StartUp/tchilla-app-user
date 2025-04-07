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

class RedefinePasswordPage extends StatefulWidget {
  final String previousWalk;
  const RedefinePasswordPage({super.key, required this.previousWalk});

  @override
  State<RedefinePasswordPage> createState() => _RedefinePasswordPageState();
}

class _RedefinePasswordPageState extends State<RedefinePasswordPage> {
  final viewmodel = Get.find<ForgontPasswordViewmodel>();

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
                title: viewmodel.localizations.reset_password,
                description: viewmodel.localizations.reset_password_description,
              ),
              AppGlobalInput(
                helpText: viewmodel.localizations.old_password,
                hintText: "***********",
                keyboardType: TextInputType.visiblePassword,
                onChanged: viewmodel.setOldPassword,
                inputType: AppInputType.password,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                helpText: viewmodel.localizations.new_password,
                hintText: "***********",
                inputType: AppInputType.password,
                keyboardType: TextInputType.visiblePassword,
                onChanged: viewmodel.setNewPassword,
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              AppGlobalVericalSpacing(
                value: 2.h,
              ),
              AppGlobalInput(
                helpText: viewmodel.localizations.confirm_new_password,
                hintText: "***********",
                inputType: AppInputType.password,
                keyboardType: TextInputType.visiblePassword,
                onChanged: viewmodel.setConfirmNewPassword,
                obscureText: true,
                textInputAction: TextInputAction.send,
                onFieldSubmitted: (p0) {
                  viewmodel.resetPassword(
                    widget.previousWalk,
                  );
                },
              ),
              AppGlobalVericalSpacing(
                value: 4.h,
              ),
              Obx(
                () => AppGlobalTextButton(
                  minWidth: 100.w,
                  isLoading: viewmodel.isLoading.value,
                  onPressed: () {
                    viewmodel.resetPassword(
                      widget.previousWalk,
                    );
                  },
                  textButton: viewmodel.localizations.redefine,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
