import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/image_widget.dart';
import 'package:movie_hub/cores/components/retry_button_widget.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/utils/sizer.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    Key? key,
    required this.message,
    this.onRetry,
    this.assetPath,
    this.useFlex = true,
    this.showButton = true,
  }) : super(key: key);

  final String message;
  final String? assetPath;
  final bool useFlex;
  final bool showButton;
  final void Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    if (useFlex) {
      return Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            hSpace(double.infinity),
            if (assetPath != null)
              SizedBox(
                height: sp(200),
                width: sp(200),
                child: ImageWidget(
                  imageTypes: ImageTypes.asset,
                  imageUrl: assetPath!,
                ),
              ),
            SizedBox(
              width: sw(70),
              child: TextWidget(
                message,
                textAlign: TextAlign.center,
                fontSize: sp(18),
              ),
            ),
            const SizedBox(height: 10.0),
            if (showButton) RetryButtonWidget(callback: () => onRetry!.call()),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        hSpace(double.infinity),
        if (assetPath != null)
          SizedBox(
            height: sp(200),
            width: sp(200),
            child: ImageWidget(
              imageTypes: ImageTypes.asset,
              imageUrl: assetPath!,
            ),
          ),
        TextWidget(message, textAlign: TextAlign.center, maxLines: 4),
        const SizedBox(height: 10.0),
        if (showButton) RetryButtonWidget(callback: () => onRetry!.call()),
      ],
    );
  }
}


