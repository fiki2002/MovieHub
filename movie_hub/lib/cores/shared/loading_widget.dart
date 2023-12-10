import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color,
    this.backGroundColor,
    this.radius,
  }) : super(key: key);

  final Color? color;
  final Color? backGroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color ?? kcWhiteColor,
        radius: radius ?? sr(10),
      ),
    );
  }
}
