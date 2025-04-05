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
import 'package:tchilla/viewmodel/forgont_password_viewmodel.dart';

class ForgotPassswordAuthEmailPage extends StatefulWidget {
  const ForgotPassswordAuthEmailPage({super.key});

  @override
  State<ForgotPassswordAuthEmailPage> createState() =>
      _ForengePassswordAuthEmailPageState();
}

class _ForengePassswordAuthEmailPageState
    extends State<ForgotPassswordAuthEmailPage> {
  final viewmodel = Get.find<ForgontPasswordViewmodel>();
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
          Headerpage(
            title: viewmodel.localizations.forgot_password,
            description:
                viewmodel.localizations.forgot_password_description,
          ),
          AppGlobalInput(
            helpText: viewmodel.localizations.email_address,
            hintText: "celson.paixao@gmail.com",
            focusNode: viewmodel.emailFocus,
           onChanged: viewmodel.chengeEmail,
            keyboardType: TextInputType.emailAddress,
          ),
          AppGlobalVericalSpacing(
            value: 3.h,
          ),
          AppGlobalTextButton(
            minWidth: 100.w,
            onPressed: () => viewmodel.submitEmail(
            
             
            ),
            textButton: viewmodel.localizations.confirm,
          )
        ],
      )),
    );
  }
}
