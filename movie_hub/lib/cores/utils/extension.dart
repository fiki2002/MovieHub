import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:movie_hub/cores/constants/palette.dart';

/// extension for SVG
///
extension SvgExtension on String {
  /// SVG with color
  SvgPicture get svg => SvgPicture.asset(
        this,
        fit: BoxFit.scaleDown,
        color: kcWhiteColor.withOpacity(0.8),
      );
}

/// extension for logging objects
extension LogExtension<T> on T {
  void log([s = '']) {
    if (kDebugMode == false) return;
    dev.log(
      '$this $s',
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DateTimeExtension on DateTime {
  String parse() {
    return DateFormat.yMMMd().format(this);
  }
}
