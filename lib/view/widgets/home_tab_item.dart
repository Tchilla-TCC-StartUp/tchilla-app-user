import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_text.dart';

class HomeTabItem extends StatelessWidget {
  final String title;
  const HomeTabItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: AppGlobalText(
        text: title,
        style: TextStyleEnum.p_bold,
      ),
    );
  }
}
