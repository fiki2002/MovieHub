import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/loading_widget.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/constants/font_size.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/cores/utils/sizer.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w700,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        borderColor = null,
        iconSize = null,
        iconColor = null;

  const Button.withBorderLine({
    super.key,
    required this.text,
    this.onTap,
    this.color = Colors.transparent,
    this.borderColor = kcPrimaryColor,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight = FontWeight.w700,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        iconColor = null;

  const Button.loading({
    super.key,
    this.onTap,
    this.color,
    this.height,
    this.width,
  })  : busy = true,
        iconData = null,
        text = null,
        textColor = null,
        textSize = kfsMedium,
        textFontWeight = null,
        iconSize = null,
        iconColor = null,
        borderColor = null,
        active = true,
        circular = false;

  const Button.smallSized({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsMedium,
    this.height,
    this.width,
    this.textFontWeight,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        borderColor = null,
        iconColor = null;

  const Button.icon({
    super.key,
    required this.iconData,
    required this.height,
    required this.width,
    required this.onTap,
    this.color,
    this.iconColor,
    this.iconSize,
    this.circular = false,
    this.active = true,
  })  : busy = false,
        text = null,
        borderColor = null,
        textColor = null,
        textSize = kfsMedium,
        textFontWeight = null;

  final String? text;
  final IconData? iconData;
  final void Function()? onTap;
  final bool busy;
  final bool active;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final double? iconSize;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    const double defaultHeight = 45.0;
    final double defaultWidth = MediaQuery.of(context).size.width * 0.95;

    return SizedBox(
      height: sp(height ?? defaultHeight),
      width: sp(width ?? defaultWidth),
      child: TextButton(
        onPressed: () {
          if (active == false) return;

          onTap!();
        },
        style: getButtonStyle(),
        child: getButtonChild(),
      ),
    );
  }

  ButtonStyle getButtonStyle() {
    MaterialStateProperty<RoundedRectangleBorder> shape;

    if (circular) {
      shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sp(100.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    } else {
      shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sp(5.0)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    }

    MaterialStateProperty<Color> backgroundColor;
    if (busy) {
      backgroundColor = MaterialStateProperty.all(kcPrimaryColor);
    } else if (active == false) {
      backgroundColor = MaterialStateProperty.all(kcGrey400);
    } else {
      backgroundColor = MaterialStateProperty.all(color ?? kcPrimaryColor);
    }

    return ButtonStyle(
      shape: shape,
      backgroundColor: backgroundColor,
    );
  }

  Widget getButtonChild() {
    if (text == null) {
      if (busy) {
        return SizedBox(
          height: sp(21),
          width: sp(21),
          child: const LoadingWidget(
            color: kcWhite,
            backGroundColor: kcPrimaryColor,
          ),
        );
      } else {
        return Icon(
          iconData,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 20.0,
        );
      }
    } else {
      return TextWidget(
        text ?? 'no text',
        textColor: textColor ?? Colors.white,
        fontSize: sp(15),
        fontWeight: textFontWeight,
      );
    }
  }
}
