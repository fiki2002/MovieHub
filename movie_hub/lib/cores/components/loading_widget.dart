import 'package:flutter/material.dart';
import 'package:movie_hub/cores/constants/palette.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color,
    this.backGroundColor,
    this.value,
    this.strokeWidth,
  }) : super(key: key);

  final Color? color;
  final Color? backGroundColor;
  final double? value;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: strokeWidth ?? 2.0,
      backgroundColor: backGroundColor ?? kcWhiteColor,
      color: color ?? kcWhiteColor,
      value: value,
    );
  }
}
