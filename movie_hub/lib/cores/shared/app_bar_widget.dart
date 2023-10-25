import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_hub/cores/navigator/app_router.dart';
import 'package:movie_hub/cores/utils/sizer.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.showBackButton,
    this.trailing,
    required this.useSpacer,
  });
  final String title;
  final bool showBackButton;
  final Widget? trailing;
  final bool useSpacer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (showBackButton)
          GestureDetector(
            onTap: goBack,
            child: Padding(
              padding: EdgeInsets.only(
                right: sp(showBackButton ? 20.0 : 40),
                top: sp(20.0),
                bottom: sp(20.0),
              ),
              child: Center(
                child: Icon(
                  Platform.isIOS
                      ? Icons.arrow_back_ios_new_rounded
                      : Icons.arrow_back,
                  size: sp(20),
                ),
              ),
            ),
          )
        else
          const SizedBox.shrink(),
        if (useSpacer) const Spacer(),
        // TextWidget(title, fontSize: sp(24)),
        Text(title),
        if (useSpacer) const Spacer(),
        trailing ?? SizedBox(height: sp(20), width: sp(40)),
      ],
    );
  }
}
