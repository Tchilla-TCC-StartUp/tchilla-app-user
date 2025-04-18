import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_image_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/view/widgets/zig_zag_divider.dart';

class TiketPage extends StatefulWidget {
  final String id;
  const TiketPage({super.key, required this.id});

  @override
  State<TiketPage> createState() => _TiketPageState();
}

class _TiketPageState extends State<TiketPage> {
  @override
  Widget build(BuildContext context) {
    final services = [
      "Dj",
      'Buffet',
      'Decoração',
      'Música',
      'Fotografia',
      'Filmagem',
      'Iluminação',
      'Transporte',
      'Segurança',
      'Limpeza',
    ];
    return Scaffold(
      appBar: AppBar(
        leading: AppGlobalBackButton(onTap: Get.find<Navigation>().navigateToHome,),
        centerTitle: true,
      ),
      body: AppLayoutpage(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppGlobalVericalSpacing(value: 2.h),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Image.asset(
                      AppAssetsImages.logotipoPng,
                      height: 50.px,
                      width: 150.px,
                    ),
                  ),
                  AppGlobalVericalSpacing(value: 3.h),
                  _buildTiketTitle(),
                  const AppGlobalVericalSpacing(),
                  _builLocation(),
                  AppGlobalVericalSpacing(value: 2.h),
                  _buildTiketInfo(),
                  const ZigZagDivider(),
                  _buildServices(services),
                  const ZigZagDivider(),
                  _buildPrice(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 2.h,
              ),
              child: AppGlobalImageButton(
                color: primary950,
                onPressed: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppGlobalText(
                      text: AppLocalizations.of(context)!.downloadReceipt,
                      style: TextStyleEnum.p_medium,
                      color: primary50,
                    ),
                    AppGlobalHorizontalSpacing(
                      value: 10.px,
                    ),
                    const Icon(
                      Icons.file_download_outlined,
                      color: primary50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildServices(List<String> services) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: AppLocalizations.of(context)!.service,
          style: TextStyleEnum.h3_medium,
          color: gray800,
          align: TextAlign.justify,
        ),
        AppGlobalVericalSpacing(value: 1.h),
        Wrap(
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.start,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          spacing: 10.px,
          runSpacing: 10.px,
          children: List.generate(
              services.length,
              (index) => Container(
                    width: 28.w,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: gray900.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: AppGlobalText(
                      text: services[index],
                      style: TextStyleEnum.p_medium,
                      color: gray500,
                      align: TextAlign.justify,
                    ),
                  )),
        )
      ],
    );
  }

  _buildPrice() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppGlobalText(
            text: AppLocalizations.of(context)!.paid_amount,
            style: TextStyleEnum.h3_medium,
            color: gray800,
            align: TextAlign.justify,
          ),
          const AngolaPrice(
            price: 250000,
            style: TextStyleEnum.h3_bold,
            color: primary900,
          )
        ],
      ),
    );
  }

  _buildTiketTitle() {
    return Align(
      alignment: Alignment.topLeft,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          AppGlobalText(
            text: "${AppLocalizations.of(context)!.reservation}:",
            style: TextStyleEnum.h3_bold,
            color: gray700,
          ),
          const AppGlobalHorizontalSpacing(),
          AppGlobalText(
            text: "Lindeza Club",
            style: TextStyleEnum.h3_bold,
            color: primary950,
          ),
        ],
      ),
    );
  }

  _buildTiketInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLabelInfoEvent(
          title: AppLocalizations.of(context)!.event_date,
          info: "25 Nov 2025",
        ),
        _buildLabelInfoEvent(
          title: AppLocalizations.of(context)!.event_type,
          info: "Casamento",
        ),
        _buildLabelInfoEvent(
          title: AppLocalizations.of(context)!.number_of_guests,
          info: "225 Convidados",
        ),
      ],
    );
  }

  _buildLabelInfoEvent({required String title, required String info}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppGlobalText(
          text: "$title :",
          style: TextStyleEnum.p_medium,
          color: gray600,
          align: TextAlign.justify,
        ),
        AppGlobalText(
          text: info,
          style: TextStyleEnum.p_medium,
          color: gray800,
          align: TextAlign.justify,
        ),
      ],
    );
  }

  _builLocation() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssetsImages.locationIconSvg,
          colorFilter: const ColorFilter.mode(
            primary500,
            BlendMode.srcIn,
          ),
          width: 25.px,
          height: 25.px,
        ),
        AppGlobalHorizontalSpacing(
          value: 2.w,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppGlobalText(
              text: "Benfica, Zona Verde II",
              style: TextStyleEnum.p_medium,
              color: gray600,
              align: TextAlign.justify,
            ),
          ],
        ),
      ],
    );
  }
}
