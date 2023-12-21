import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class CachedNetworkImageWidget extends StatefulWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.url,
    this.radius,
    this.height,
    this.fit,
    this.width,
    this.loader,
  });

  final String url;
  final double? radius;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Widget? loader;

  @override
  State<CachedNetworkImageWidget> createState() => _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius ?? 0),
      child: CachedNetworkImage(
        imageUrl: widget.url,
        fadeOutCurve: Curves.easeInCirc,
        httpHeaders: const {'timeout': '30'},
        fit: widget.fit,
        height: widget.height,
        errorWidget: (_, __, ___) => Container(
          color: kcWhiteColor,
          child: const Center(
            child: Icon(Icons.error),
          ),
        ),
        placeholder: (_, __) => widget.loader ?? const LoadingWidget(),
      ),
    );
  }
}
