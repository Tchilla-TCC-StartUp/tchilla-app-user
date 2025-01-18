import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/resources/app_size.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_input.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';
import 'package:tchilla/viewmodel/app_circular_liner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              _buildBackground(),
              _buildContainerMan(),
            ],
          ),
        ),
      ),
    );
  }

  _buildContainerMan() {
    return Positioned(
      top: 25.h,
      bottom: 10.h,
      left: getAdaptativeWidth(8.w, 6.w, 4.w),
      right: getAdaptativeWidth(8.w, 6.w, 4.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppGlobalText(
                text: "Local Evento",
                style: TextStyleEnum.h3_bold,
                color: primary950,
              ),
              const AppGlobalVericalSpacing(),
              const AppGlobalInput(
                hintText: "EX: provincia/municipio/bairro",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ],
          )),
        ),
      ),
    );
  }

  _buildBackground() {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            color: primary950,
            child: Stack(
              children: [
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: Transform.scale(
                    scale: 1.w,
                    child: CustomPaint(
                      size: const Size(100, 100),
                      painter: CircleSeriesPainter(
                        circleColor: primary300,
                        spacing: 2,
                        strokeWidth: .2
                      ), 
                    ),
                  ),
                ),
                Positioned(
                  top: 15.h,
                  left: getAdaptativeWidth(8.w, 6.w, 4.w),
                  right: getAdaptativeWidth(8.w, 6.w, 4.w),
                  child: AppGlobalText(
                    text: "Organize seu evento\nem questão de minutos ",
                    style: TextStyleEnum.h2_bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6, // Flexível, ocupa 60% da tela
          child: Container(
            width: double.infinity,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
