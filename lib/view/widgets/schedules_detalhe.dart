import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/resources/app_formaters.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_image_button.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/app_responsible_card.dart';
import 'package:tchilla/view/widgets/zig_zag_divider.dart';
import 'package:tchilla/viewmodel/event/schedule_detalhe_viewmodel.dart';

class SchedulesDetalhe extends GetView<ScheduleDetalheViewmodel> {
  final String previousWalk;
  const SchedulesDetalhe({super.key, required this.previousWalk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppGlobalText(
          text: "Detalhes de Agendamento",
          style: TextStyleEnum.h3_bold,
        ),
        leading: AppGlobalBackButton(
          onTap: () => controller.goBack(previousWalk),
        ),
      ),
      body: AppLayoutpage(
          body: Column(
        children: [
          Expanded(
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
                  _buildState(status: ProposedStatus.schedule),
                  AppGlobalVericalSpacing(
                    value: 3.h,
                  ),
                  AppResponsibleCard(
                    name: "Celson Paixão",
                    role: "Admin",
                    imageUrl: AppAssetsImages.defaultUserImage,
                  ),
                  _buildEventSummaryData(
                    context: context,
                    eventData: "25/Novembro/2035 - 18h",
                    eventType: "Casamento",
                    numberOfGuests: 200,
                    services: ["Dj", "Decoração"],
                  ),
                  const ZigZagDivider(),
                  _buildPrice(),
                  const AppGlobalVericalSpacing()
                ],
              ),
            ),
          ),
          AppGlobalImageButton(
            color: primary950,
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppGlobalText(
                  text: controller.localizations.downloadReceipt,
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
          const AppGlobalVericalSpacing()
        ],
      )),
    );
  }

  Container _buildState({required ProposedStatus status}) {
    Color color;
    String message;
    switch (status) {
      case ProposedStatus.cancelad:
        message = "Cancelado";
        color = Colors.redAccent.shade700;
      case ProposedStatus.sucess:
        message = "Sucesso";
        color = Colors.greenAccent.shade700;
      case ProposedStatus.pending:
        message = "Pendente";
        color = Colors.amberAccent.shade700;
      case ProposedStatus.schedule:
        message = "Agendado";
        color = Colors.blueAccent.shade700;
    }

    return Container(
      alignment: Alignment.center,
      width: 100.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: AppGlobalText(
        text: message,
        style: TextStyleEnum.h3_normal,
        color: color,
      ),
    );
  }

  _buildPrice() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppGlobalText(
          text: controller.localizations.paid_amount,
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
        const ZigZagDivider(),
        AppGlobalText(
          text: controller.localizations.appointment_summary,
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 2.h),
        _buildInfoRow(controller.localizations.event_date, eventData),
        _buildInfoRow(controller.localizations.event_type, eventType),
        _buildInfoRow(controller.localizations.number_of_guests,
            numberOfGuests.toString()),
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
}
