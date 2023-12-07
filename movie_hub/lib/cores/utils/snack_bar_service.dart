import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class SnackBarService {
  static void showErrorSnackBar({
    required BuildContext context,
    required String message,
    EdgeInsetsGeometry? margin,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: TextWidget(
        message,
        textColor: kcWhiteColor,
        textAlign: TextAlign.left,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      margin: margin ??
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        label: 'dismiss',
        textColor: kcWhiteColor,
        onPressed: () => hideSnackBar(context),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showSuccessSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: TextWidget(
        message,
        textColor: kcWhiteColor,
        textAlign: TextAlign.left,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: kcPrimaryColor,
      action: SnackBarAction(
        label: 'dismiss',
        textColor: kcWhiteColor,
        onPressed: () => hideSnackBar(context),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showWarningSnackBar({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      content: TextWidget(
        message,
        textColor: kcWhiteColor,
        textAlign: TextAlign.left,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      behavior: SnackBarBehavior.floating,
      duration: duration,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      backgroundColor: Colors.grey.shade800,
      action: SnackBarAction(
        label: 'dismiss',
        textColor: kcWhiteColor,
        onPressed: () => hideSnackBar(context),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }
}
