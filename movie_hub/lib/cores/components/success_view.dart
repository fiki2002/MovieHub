import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/buttons.dart';
import 'package:movie_hub/cores/components/image_widget.dart';
import 'package:movie_hub/cores/components/scaffold_widget.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/cores/utils/sizer.dart';

class SuccessView extends StatelessWidget {
  static const String route = '/success-view';

  final String title;
  final String text;
  final String otherText;
  final VoidCallback onTap;
  final String buttonText;

  const SuccessView({
    super.key,
    this.title = 'Successful',
    required this.text,
    required this.otherText,
    required this.onTap,
    this.buttonText = 'Continue',
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      useSingleScroll: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          hSpace(double.infinity),
          vSpace(40),
          SizedBox(
            width: sp(246),
            height: sp(246),
            child: const ImageWidget(
              imageUrl: 'assets/images/success_image.png',
              imageTypes: ImageTypes.asset,
            ),
          ),
          vSpace(20),
          SizedBox(
            width: sw(70),
            child: TextWidget(
              title,
              fontSize: sp(24),
              fontWeight: FontWeight.w700,
              textColor: kcPrimaryColor,
              textAlign: TextAlign.center,
            ),
          ),
          vSpace(10),
          SizedBox(
            width: sw(70),
            child: TextWidget(
              text,
              fontSize: sp(14),
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: sw(70),
            child: TextWidget(
              otherText,
              fontSize: sp(14),
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
          ),
          vSpace(10),
          Button(text: buttonText, onTap: onTap),
          vSpace(20),
        ],
      ),
    );
  }
}
