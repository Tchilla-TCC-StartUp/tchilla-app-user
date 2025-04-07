import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/model/proposed_model.dart';
import 'package:tchilla/resources/app_formaters.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/pages/error_try_again.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_loading.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/proposed_card.dart';
import 'package:tchilla/viewmodel/event/schedules_viewmodel.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  final viewmodel = Get.find<SchedulesViewmodel>();

  @override
  void initState() {
    super.initState();
    viewmodel.initEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppGlobalBackButton(),
        title: AppGlobalText(
          text: viewmodel.localizations.my_schedules,
          style: TextStyleEnum.h3_bold,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return viewmodel.isLoading.value
            ? const AppGlobalLoading()
            : viewmodel.isError.value
                ? ErrorTryAgain(message: viewmodel.errorMessage.value)
                : viewmodel.proposeds.isNotEmpty
                    ? AppLayoutpage(
                        body: ListView.builder(
                        itemCount: viewmodel.proposeds.length,
                        itemBuilder: (context, intex) {
                          var item = viewmodel.proposeds[intex];
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
          onClick: () {},
          proposed: proposed,
        )
      ],
    );
  }
}
