import 'dart:developer' as dev;

class AppLogger {
  AppLogger._();

  ///  To make turning on and off of logger easy
  static bool _showLogs = false;

  static void configure({required bool showLogs}) {
    _showLogs = showLogs;
  }

  static void log(Object? e, [s]) {
    if (_showLogs) dev.log("Logs:: $e StackTrace:: $s");
  }
}
