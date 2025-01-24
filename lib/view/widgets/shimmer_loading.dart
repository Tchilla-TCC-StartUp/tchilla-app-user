import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35.w,
            height: 12.h,
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.grey,
          ),
          Container(
            width: 35.w,
            height: 12.h,
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.grey,
          ),
          Container(
             height: 12.h,
            width: double.infinity,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
