import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.height,
    this.highlightColor,
    this.baseColor,
  });
  final double? height;
  final Color? highlightColor;
  final Color? baseColor;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? kcBackground,
      highlightColor: highlightColor ?? Colors.white,
      child: ColoredBox(
        color: Colors.black.withOpacity(.04),
        child: SizedBox(
          height: height ?? screenHeight * .5,
          width: double.infinity,
        ),
      ),
    );
  }
}
