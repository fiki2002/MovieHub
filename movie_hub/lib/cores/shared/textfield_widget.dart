import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_hub/cores/cores.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.title,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.fillColor,
    this.validator,
    this.inputFormatters,
    this.focusNode,
    this.onFieldSubmitted, this.textInputAction,
  });
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;

  final ValueNotifier<bool> obscureText = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureText,
        builder: (context, bool value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title != null)
                TextWidget(
                  title!,
                  fontSize: sp(kfsTiny),
                  fontWeight: FontWeight.w300,
                ),
              vSpace(kMinute),
              TextFormField(
                validator: validator,
                focusNode: focusNode,
                cursorColor: kcWhiteColor.withOpacity(0.8),
                onFieldSubmitted: onFieldSubmitted,
                style: TextStyle(
                  color: kcWhiteColor.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  fontSize: sp(kfsTiny),
                ),
                keyboardType: keyboardType,
                controller: controller,
                obscureText: value && isPassword,
                decoration: InputDecoration(
                  fillColor: fillColor,
                  filled: fillColor == null ? false : true,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: kcWhiteColor.withOpacity(0.4),
                    fontWeight: FontWeight.w400,
                    fontSize: sp(kfsTiny),
                  ),
                  prefixIcon: prefixIcon,
                  suffixIcon: isPassword == true
                      ? suffixWidget(value)
                      : suffixIcon ?? const SizedBox(),
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
        child: eyeIcon.svg,
      );
    } else {
      return GestureDetector(
        onTap: () => obscureText.value = !obscureText.value,
        child: eyeCloseIcon.svg,
      );
    }
  }
}
