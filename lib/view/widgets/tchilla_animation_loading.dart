import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tchilla/resources/app_assets_images.dart';

class TchillaAnimationLoading extends StatelessWidget {
  const TchillaAnimationLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(
      AppAssetsImages.tchillaLoadingAnimation,
    ));
  }
}
