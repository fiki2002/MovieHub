import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/constants/font_size.dart';
import 'package:movie_hub/cores/constants/palette.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
    this.text, {
    Key? key,
    this.fontSize = kfsMedium,
    this.textColor = kcWhiteColor,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.height,
    this.fontFamily,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? height;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily ?? 'Montserrat',
        color: textColor,
        fontWeight: fontWeight,
        decoration: decoration,
        height: height,
      ),
      textAlign: textAlign,
      overflow: overflow,
      softWrap: true,
      maxLines: maxLines,
    );
  }
}

class RichTextWidget extends StatelessWidget {
  const RichTextWidget(
    this.text,
    this.text2, {
    Key? key,
    this.fontSize = kfsMedium,
    this.fontSize2 = kfsMedium,
    this.textColor = kcWhiteColor,
    this.textColor2 = kcWhiteColor,
    this.fontWeight = FontWeight.w400,
    this.fontWeight2 = FontWeight.w400,
    this.textAlign = TextAlign.justify,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.fontFamily,
    this.onTap,
  }) : super(key: key);

  final String text;
  final String text2;
  final double? fontSize;
  final double? fontSize2;
  final Color? textColor;
  final String? fontFamily;

  final Color? textColor2;
  final FontWeight? fontWeight;
  final FontWeight? fontWeight2;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final GestureRecognizer? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          fontFamily: fontFamily ?? 'Montserrat',
        ),
        children: <InlineSpan>[
          TextSpan(
            text: text2,
            recognizer: onTap,
            style: TextStyle(
              fontSize: fontSize2,
              color: textColor2,
              fontFamily: fontFamily ?? 'Montserrat',
              fontWeight: fontWeight2,
              decoration: decoration,
            ),
          )
        ],
      ),
    );
  }
}
