import 'package:flutter/cupertino.dart';
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
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? kcWhiteColor,
      ),
    );
  }
}
