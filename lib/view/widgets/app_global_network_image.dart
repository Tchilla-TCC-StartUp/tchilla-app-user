import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchilla/resources/app_assets_images.dart';
import 'package:tchilla/style/colors.dart';
import 'package:tchilla/view/widgets/app_global_shimmer.dart';

class AppGlobalNetworkImage extends StatelessWidget {
  const AppGlobalNetworkImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
    this.border,
  });

  final String image;
  final double? width;
  final double? border;
  final double? height;
  final BoxFit? fit;

  bool get isSvg => image.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border ?? 8),
      ),
      child: isSvg
          ? SvgPicture.network(
              image,
              width: width,
              height: height,
              fit: fit ?? BoxFit.cover,
              placeholderBuilder: (context) => _buildShimmer(border),
            )
          : CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: image,
              fit: fit ?? BoxFit.cover,
              placeholder: (context, url) => _buildShimmer(border),
              errorWidget: (context, url, error) {
                // return const Icon(Icons.error, color: Colors.red);
                return Center(
                  child: SvgPicture.asset(
                    AppAssetsImages.logoSvg,
                    width: width,
                    height: height,
                    // fit: BoxFit.fitHeight,
                  ),
                );
              },
            ),
    );
  }

  Widget _buildShimmer(double? border) {
    return AppGlobalShimmer(
      width: width ?? 50,
      height: height ?? 50,
      borderRadius: border ?? 8,
    );
  }
}
