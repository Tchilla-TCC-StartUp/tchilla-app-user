import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/proposed_model.dart';
import 'package:tchilla/resources/app_formaters.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/shimmers/propose_list_shimmer.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/proposed_card.dart';
import 'package:tchilla/viewmodel/event/schedules_viewmodel.dart';

class SchedulesPage extends GetView<SchedulesViewmodel> {
  const SchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
        title: AppGlobalText(
          text: controller.localizations.my_schedules,
          style: TextStyleEnum.h3_bold,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const ProposedListShimmer()
            : controller.isError.value
                ? ErrorTryAgain(message: controller.errorMessage.value)
                : controller.proposeds.isNotEmpty
                    ? AppLayoutpage(
                        body: ListView.builder(
                        itemCount: controller.proposeds.length,
                        itemBuilder: (context, intex) {
                          var item = controller.proposeds[intex];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: _buildSchedulesCard(proposed: item),
                          );
                        },
                      ))
                    : Center(
                        child: AppGlobalText(
                          text: "Sem nehum agendamneto ",
                          style: TextStyleEnum.p_medium,
                        ),
                      );
      }),
    );
  }

  _buildSchedulesCard({required ProposedModel proposed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(
            text: formatDateToReadableString(proposed.date!),
            style: TextStyleEnum.h3_bold),
        const AppGlobalVericalSpacing(),
        ProposedCard(
          onClick: () => controller.goToDetalhes(proposed.id),
          proposed: proposed,
        )
      ],
    );
  }
}
