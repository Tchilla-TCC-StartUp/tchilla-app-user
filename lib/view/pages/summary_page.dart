import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_formaters.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/angola_price.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_border_button.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_network_image.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/app_responsible_card.dart';
import 'package:tchilla/viewmodel/event/summary_viewmodel.dart';

class SummaryPage extends GetView<SummaryViewmodel> {
  final String id;
  const SummaryPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
        centerTitle: true,
        title: AppGlobalText(
          text: controller.localizations.appointment_summary,
          style: TextStyleEnum.h3_bold,
        ),
      ),
      body: AppLayoutpage(
        body: Obx(
          () {
            return controller.isLoading.value
                ? const AppGlobalLoading()
                : controller.isError.value
                    ? ErrorTryAgain(message: controller.errorMessage.value)
                    : _buildBody();
          },
        ),
      ),
    );
  }

  Column _buildBody() {
    return Column(
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
    );
  }

  _buildBottomInfo() {
    return Container(
      decoration: const BoxDecoration(
        color: primary50,
      ),
      width: 100.w,
      height: 100.px + 1.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              AppGlobalText(
                text: "${controller.localizations.total}:",
                style: TextStyleEnum.h3_medium,
              ),
              const AppGlobalHorizontalSpacing(),
              const AngolaPrice(
                price: 308000,
                style: TextStyleEnum.h3_bold,
                color: primary950,
              ),
            ],
          ),
          const AppGlobalVericalSpacing(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppGlobalBorderButton(
                onPressed: controller.navigator.navigateToBack,
                textButton: controller.localizations.cancel,
                minWidth: 40.w,
              ),
              AppGlobalTextButton(
                minWidth: 40.w,
                onPressed: () => controller.clickContinue("pjk,d"),
                textButton: controller.localizations.lb_continue,
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
    required String eventData,
    required String eventType,
    required int numberOfGuests,
    required List<String> services,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
          text: controller.localizations.appointment_summary,
          style: TextStyleEnum.h3_bold,
        ),
        AppGlobalVericalSpacing(value: 2.h),
        _buildInfoRow(controller.localizations.event_date, eventData),
        _buildInfoRow(controller.localizations.event_type, eventType),
        _buildInfoRow(controller.localizations.number_of_guests,
            numberOfGuests.toString()),
        AppGlobalVericalSpacing(value: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppGlobalText(
              text: controller.localizations.service,
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
}
