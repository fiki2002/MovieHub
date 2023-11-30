import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kcBackground,
      highlightColor: Colors.grey[700]!,
      child: ColoredBox(
        color: Colors.black.withOpacity(.04),
        child: SizedBox(
          height: height?? screenHeight * .5,
        ),
      ),
    );
  }
}
