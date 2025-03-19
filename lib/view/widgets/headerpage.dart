import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class Headerpage extends StatelessWidget {
  final String title;
  final String description;
  const Headerpage({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppGlobalVericalSpacing(
          value: 2.h,
        ),
        AppGlobalText(
          text: title,
          style: TextStyleEnum.h2_medium,
        ),
        AppGlobalText(
          text: description,
          style: TextStyleEnum.h3_medium,
        ),
        AppGlobalVericalSpacing(
          value: 3.h,
        ),
      ],
    );
  }
}
