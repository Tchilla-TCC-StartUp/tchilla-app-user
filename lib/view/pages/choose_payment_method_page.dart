import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/viewmodel/event/choose_payment_method_viewmodel.dart';

class ChoosePaymentMethodPage extends GetView<ChoosePaymentMethodViewmodel> {
  const ChoosePaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppGlobalBackButton(
          onTap: controller.navigateToBack,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: AppGlobalText(
          text: controller.localizations.deposit,
          style: TextStyleEnum.h3_bold,
        ),
      ),
      body: AppLayoutpage(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalText(
            text: controller.localizations.add_or_search_deposit_methods,
            style: TextStyleEnum.h3_bold,
            color: primary950,
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalText(
            text: controller.localizations.choose_payment_method,
            style: TextStyleEnum.p_light,
            color: gray500,
          ),
          AppGlobalVericalSpacing(
            value: 3.h,
          ),
          // _buildCardPaymentMethod(
          //   title: 'Multicaixa Express',
          //   image: AppAssetsImages.mcxNetworkImage,
          //   onTap: () => controller.switchMethod(1),
          // ),
          _buildCardPaymentMethod(
            title: controller.localizations.payment_receipt,
            image: AppAssetsImages.trnasfericon,
            onTap: controller.navigator.navigateToPaymentReceipt,
          ),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
        ],
      )),
    );
  }
}

_buildCardPaymentMethod(
    {required String image,
    required void Function()? onTap,
    required String title}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: primary50,
      child: Padding(
        padding: EdgeInsets.all(8.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AppGlobalNetworkImage(
                  image: image,
                  width: 50.px,
                  height: 50.px,
                  border: 10.px,
                ),
                AppGlobalHorizontalSpacing(
                  value: 10.px,
                ),
                AppGlobalText(
                  text: title,
                  style: TextStyleEnum.p_bold,
                  color: gray900,
                ),
              ],
            ),
            SvgPicture.asset(
              AppAssetsImages.arrowRightSvg2,
            )
          ],
        ),
      ),
    ),
  );
}
