import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/constants/asset.dart';
import 'package:movie_hub/cores/constants/font_size.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/cores/utils/extension.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.fillColor,
  });
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextInputType? keyboardType;
  final Color? fillColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, bool value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.title != null)
                TextWidget(
                  widget.title!,
                  fontSize: kfsTiny.sp,
                  fontWeight: FontWeight.w300,
                ),
              kMinute.sH,
              TextFormField(
                cursorColor: kcWhiteColor.withOpacity(0.8),
                style: TextStyle(
                  color: kcWhiteColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  fontSize: kfsTiny.sp,
                ),
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                obscureText: value && widget.isPassword,
                decoration: InputDecoration(
                  fillColor: widget.fillColor,
                  filled: widget.fillColor == null ? false : true,
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: kcWhiteColor.withOpacity(0.4),
                    fontWeight: FontWeight.w400,
                    fontSize: kfsTiny.sp,
                  ),
                  prefixIcon: widget.prefixIcon,
                  suffixIcon: widget.isPassword == true
                      ? suffixWidget(value)
                      : widget.suffixIcon ?? const SizedBox(),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: kcWhiteColor.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: kcWhiteColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: kcWhiteColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: kcWhiteColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget suffixWidget(bool value) {
    if (value) {
      return GestureDetector(
          onTap: () => obscureText.value = !obscureText.value,
          child: eyeIcon.svg);
    } else {
      return GestureDetector(
        onTap: () => obscureText.value = !obscureText.value,
        child: eyeCloseIcon.svg,
      );
    }
  }
}
