import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  static void log(Object? e, [s]) {
    if (kDebugMode == false) return;
    dev.log("Logs:: $e StackTrace:: $s");
  }
}
