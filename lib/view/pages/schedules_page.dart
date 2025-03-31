import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tchilla/model/proposed_model.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_back_button.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/proposed_card.dart';
import 'package:tchilla/viewmodel/schedules_viewmodel.dart';

class SchedulesPage extends StatefulWidget {
  const SchedulesPage({super.key});

  @override
  State<SchedulesPage> createState() => _SchedulesPageState();
}

class _SchedulesPageState extends State<SchedulesPage> {
  final viewmodel = Get.find<SchedulesViewmodel>();
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
      body: AppLayoutpage(
          body: Column(
        children: [
          _buildSchedulesCard(
            date: "25 MAR 2025",
            proposed: ProposedModel(
              image: AppAssetsImages.defaultProposedImage,
              name: "Salão de Festa Mela",
              location: "Patriota",
              suportpersonNumer: 300,
              price: 400000,
              status: ProposedStatus.pending,
              type: ProposedType.combo,
            ),
          ),
        ],
      )),
    );
  }

  _buildSchedulesCard({required String date, required ProposedModel proposed}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalText(text: date, style: TextStyleEnum.h3_bold),
        const AppGlobalVericalSpacing(),
        ProposedCard(
          onClick: () {},
          proposed: proposed,
        )
      ],
    );
  }
}
