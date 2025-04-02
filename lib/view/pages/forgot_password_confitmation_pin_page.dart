import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/headerpage.dart';
import 'package:tchilla/viewmodel/forgont_password_viewmodel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordConfirmationPinPage extends StatefulWidget {
  const ForgotPasswordConfirmationPinPage({super.key});

  @override
  State<ForgotPasswordConfirmationPinPage> createState() =>
      _ForgotPasswordConfirmationPinPageState();
}

class _ForgotPasswordConfirmationPinPageState
    extends State<ForgotPasswordConfirmationPinPage> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final viewmodel = Get.find<ForgontPasswordViewmodel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
      ),
      body: AppLayoutpage(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Headerpage(
                title: viewmodel.localizations.confirmation_pin,
                description:
                    viewmodel.localizations.confirmation_pin_description,
              ),
              AppGlobalText(
                text: viewmodel.localizations.pin,
                style: TextStyleEnum.h3_bold,
              ),
              const AppGlobalVericalSpacing(),
              _buildInputs(context),
              AppGlobalVericalSpacing(
                value: 3.h,
              ),
              AppGlobalTextButton(
                onPressed: () {
                  final pin = _controllers.map((c) => c.text).join();
                  viewmodel.confirmPin(pin, context);
                },
                textButton: viewmodel.localizations.confirm,
                minWidth: 100.w,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildInputs(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        6,
        (index) => SizedBox(
          width: 12.w,
          height: 12.w,
          child: TextFormField(
            controller: _controllers[index],
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xffAFBACA),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xffAFBACA),
                  width: 1,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                  color: Color(0xffAFBACA),
                  width: 1,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            buildCounter: (_,
                    {required int currentLength,
                    required bool isFocused,
                    int? maxLength}) =>
                null,
            onChanged: (value) {
              if (value.isNotEmpty && index < 5) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
