import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_border_button.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tchilla/view/widgets/app_responsible_card.dart';

class SummaryPage extends StatefulWidget {
  final String id;
  const SummaryPage({super.key, required this.id});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
        centerTitle: true,
        title: AppGlobalText(
          text: AppLocalizations.of(context)!.appointment_summary,
          style: TextStyleEnum.h3_bold,
        ),
      ),
      body: AppLayoutpage(
        body: Column(
          children: [
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppGlobalVericalSpacing(
                      value: 1.h,
                    ),
                    ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      child: AppGlobalNetworkImage(
                        image: AppAssetsImages.defaultProposedImage,
                        width: 100.w,
                        height: 180.px,
                      ),
                    ),
                    AppGlobalVericalSpacing(
                      value: 3.h,
                    ),
                    AppResponsibleCard(
                      name: "Celson Paixão",
                      role: "Admin",
                      imageUrl: AppAssetsImages.defaultUserImage,
                    ),
                    AppGlobalVericalSpacing(
                      value: 3.h,
                    ),
                    _buildEventSummaryData(
                      context: context,
                      eventData: "25/Novembro/2035 - 18h",
                      eventType: "Casamento",
                      numberOfGuests: 200,
                      services: ["Dj", "Decoração"],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildBottomInfo(),
            )
          ],
        ),
      ),
    );
  }

  _buildBottomInfo() {
    return Container(
      decoration: const BoxDecoration(
        color: primary50,
      ),
      width: 100.w,
      height: 100.px,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              AppGlobalText(
                text: "Total:",
                style: TextStyleEnum.h3_medium,
              ),
              const AppGlobalHorizontalSpacing(),
              AppGlobalText(
                text: formatAngolaPrice(380000),
                style: TextStyleEnum.h3_bold,
              ),
            ],
          ),
          const AppGlobalVericalSpacing(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalBorderButton(
                onPressed: () {},
                textButton: "Cancelar",
                minWidth: 180.px,
              ),
              AppGlobalTextButton(
                minWidth: 180.px,
                onPressed: () {},
                textButton: "Continuar",
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      children: [
        AppGlobalVericalSpacing(
          value: 20.px,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppGlobalText(
              text: label,
              style: TextStyleEnum.p_normal,
              color: gray500,
            ),
            AppGlobalText(
              text: value,
              style: TextStyleEnum.p_medium,
              color: primary900,
            ),
          ],
        ),
      ],
    );
  }

  _buildEventSummaryData({
    required BuildContext context,
    required String eventData,
    required String eventType,
    required int numberOfGuests,
    required List<String> services,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: AppLocalizations.of(context)!.appointment_summary,
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 2.h),
        _buildInfoRow(AppLocalizations.of(context)!.event_date, eventData),
        _buildInfoRow(AppLocalizations.of(context)!.event_type, eventType),
        _buildInfoRow(AppLocalizations.of(context)!.number_of_guests,
            numberOfGuests.toString()),
        AppGlobalVericalSpacing(value: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppGlobalText(
              text: AppLocalizations.of(context)!.service,
              style: TextStyleEnum.p_normal,
              color: gray500,
            ),
            Wrap(
              spacing: 4,
              runSpacing: 4,
              children: services.map((service) {
                return AppGlobalText(
                  text: "$service -",
                  style: TextStyleEnum.p_medium,
                  color: primary900,
                );
              }).toList(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 2.h),
          child: const Divider(),
        ),
        _buildInfoRow(
          "Salão de Festa",
          formatAngolaPrice(250000),
        ),
        _buildInfoRow(
          "Dj",
          formatAngolaPrice(25000),
        ),
        _buildInfoRow(
          "Decoração",
          formatAngolaPrice(105000),
        ),
      ],
    );
  }

  String formatAngolaPrice(int price) {
    final formatter = NumberFormat.currency(locale: 'pt_AO', symbol: 'Kz');
    return formatter.format(price);
  }
}
