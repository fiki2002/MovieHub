import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height?? screenHeight * .5,
      ),
    );
  }
}
