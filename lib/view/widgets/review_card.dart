import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tchilla/style/app_text_style.dart';
import 'package:tchilla/view/widgets/app_global_spacing.dart';

import '../../style/colors.dart';
import 'app_global_text.dart';
import 'app_global_user_avatar_name.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String comment;
  final double? width;
  final double rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.comment,
    required this.rating, this.width = 275,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ,
      height: 110.px,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: primary50,
        borderRadius: BorderRadius.circular(8.px),
        boxShadow: const [
          BoxShadow(
            color: primary400,
            blurRadius: 2,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppGlobalUserAvatarName(
                name: name,
                size: 35.px,
              ),
              const AppGlobalHorizontalSpacing(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppGlobalText(
                    text: name,
                    style: TextStyleEnum.review_bold,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.amber,
                        size: 16,
                      ),
                      AppGlobalText(
                        text: rating.toString(),
                        style: TextStyleEnum.review_bold,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppGlobalVericalSpacing(value: 1.h),
          AppGlobalText(
            text: comment,
            style: TextStyleEnum.review_normal,
            maxLines: 10,
            align: TextAlign.start,
            color: gray700,
          ),
        ],
      ),
    );
  }
}
