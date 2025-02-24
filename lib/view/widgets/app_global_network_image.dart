import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tchilla/view/widgets/app_global_shimmer.dart';
import 'package:tchilla/view/widgets/shimmer_loading.dart';

class AppGlobalNetworkImage extends StatelessWidget {
  const AppGlobalNetworkImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
  });

  final String image;
  final double? width;
  final double? height;
  final BoxFit? fit;

  bool get isSvg => image.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isSvg
          ? SvgPicture.network(
              image,
              width: width,
              height: height,
              fit: fit ?? BoxFit.cover,
              placeholderBuilder: (context) => _buildShimmer(),
            )
          : CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: image,
              fit: fit ?? BoxFit.cover,
              placeholder: (context, url) => _buildShimmer(),
              errorWidget: (context, url, error) =>
                  const Icon(Icons.error, color: Colors.red),
            ),
    );
  }

  Widget _buildShimmer() {
    return AppGlobalShimmer(
      width: width ?? 50,
      height: height ?? 50,
    );
  }
}
