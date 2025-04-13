import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_enums.dart';
import 'package:tchilla/services/events/navigation.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/view/widgets/app_global_text_button.dart';
import 'package:tchilla/view/widgets/app_layoutpage.dart';
import 'package:tchilla/view/widgets/animation_icon.dart';
import 'package:tchilla/viewmodel/event/sucess_schedule_viewmodel.dart';

class SucessSchedulePage extends GetView<SucessScheduleViewmodel> {
  const SucessSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLayoutpage(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AnimationIcon(type: AnimationIconType.success),
          AppGlobalVericalSpacing(
            value: 1.h,
          ),
          AppGlobalText(
            text: "Agendamento Feito com Sucesso",
            style: TextStyleEnum.h3_bold,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalTextButton(
            onPressed: controller.goToDetalhes,
            textButton: "Ver datalhes",
            minWidth: 100.w,
            color: Colors.greenAccent.shade700,
          ),
          AppGlobalVericalSpacing(
            value: 2.h,
          ),
          AppGlobalTextButton(
            onPressed: controller.navigator.navigateToBack,
            textButton: "Voltar",
            minWidth: 100.w,
            color: Colors.transparent,
          ),
        ],
      )),
    );
  }
}
