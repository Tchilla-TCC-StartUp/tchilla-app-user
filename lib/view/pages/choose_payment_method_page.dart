import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/mcx_method_view.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChoosePaymentMethodPage extends StatefulWidget {
  const ChoosePaymentMethodPage({super.key});

  @override
  State<ChoosePaymentMethodPage> createState() =>
      _ChoosePaymentMethodPageState();
}

class _ChoosePaymentMethodPageState extends State<ChoosePaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: AppGlobalText(
          text: AppLocalizations.of(context)!.deposit,
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
              text: AppLocalizations.of(context)!.add_or_search_deposit_methods,
              style: TextStyleEnum.h3_bold,
              color: primary950,
            ),
            AppGlobalVericalSpacing(
              value: 1.h,
            ),
            AppGlobalText(
              text: AppLocalizations.of(context)!.choose_payment_method,
              style: TextStyleEnum.p_light,
              color: gray500,
            ),
            AppGlobalVericalSpacing(
              value: 3.h,
            ),
            _buildCardPaymentMethod(
              image: AppAssetsImages.mcxNetworkImage,
              onTap: _builMCXMethod,
            ),
            AppGlobalVericalSpacing(
              value: 1.h,
            ),
            _buildCardPaymentMethod(
              image: AppAssetsImages.mcxNetworkImage,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  _builMCXMethod() {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.px)),
      ),
      clipBehavior: Clip.hardEdge,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return McxMethodView();
      },
    );
  }

  _buildCardPaymentMethod(
      {required String image, required void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: primary50,
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(8.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Card(
                    elevation: 5,
                    clipBehavior: Clip.hardEdge,
                    child: AppGlobalNetworkImage(
                      image: image,
                      width: 50.px,
                      height: 50.px,
                      border: 10.px,
                    ),
                  ),
                  AppGlobalHorizontalSpacing(
                    value: 10.px,
                  ),
                  AppGlobalText(
                    text: 'Multicaixa Express',
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
}
