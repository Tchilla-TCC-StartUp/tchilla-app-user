import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: image,
      placeholder: (context, url) => ShimmerLoading(
        width: width ?? 10,
        height: height ?? 10,
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error, color: Colors.red),
      fit: fit ?? BoxFit.cover,
    );
  }
}
