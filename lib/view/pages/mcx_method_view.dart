import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_phone_number_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/viewmodel/event/choose_payment_method_viewmodel.dart';

class McxMethodView extends StatefulWidget {
  final ChoosePaymentMethodViewmodel choosePaymentMethodViewmodel;
  const McxMethodView({
    super.key,
    required this.choosePaymentMethodViewmodel,
  });

  @override
  State<McxMethodView> createState() => _McxMethodViewState();
}

class _McxMethodViewState extends State<McxMethodView> {
  ChoosePaymentMethodViewmodel get viewmodel =>
      widget.choosePaymentMethodViewmodel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            child: ClipRRect(
              child: AppGlobalNetworkImage(
                width: 100.px,
                height: 100.px,
                image: AppAssetsImages.mcxNetworkImage,
              ),
            ),
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalText(
            text: viewmodel.localizations.help_text_mcx,
            style: TextStyleEnum.p_light,
            color: gray600,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalPhoneNumberInput(
            hintText: '938149766',
          ),
          AppGlobalVericalSpacing(
            value: 3.h,
          ),
          AppGlobalTextButton(
            minWidth: 100.w,
            onPressed: viewmodel.paymentMCX,
            textButton: viewmodel.localizations.lb_continue,
          )
        ],
      ),
    );
  }
}
