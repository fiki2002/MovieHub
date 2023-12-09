import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.url,
    this.radius,
    this.height,
    this.fit, this.width,
  });

  final String url;
  final double? radius;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: CachedNetworkImage(
        imageUrl: url,
        fadeOutCurve: Curves.easeInCirc,
        httpHeaders: const {'timeout': '30'},
        fit: fit,
        height: height,
        errorWidget: (_, __, ___) => Container(
          color: kcWhiteColor,
          child: const Center(
            child: Icon(Icons.error),
          ),
        ),
        placeholder: (_, __) => const LoadingWidget(),
      ),
    );
  }
}
