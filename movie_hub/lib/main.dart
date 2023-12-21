import 'dart:async';
import 'dart:ui';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/app/my_app.dart';
import 'package:movie_hub/app/locator.dart';
import 'package:movie_hub/cores/cores.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      SetUpLocators.init();

      await Setups.run();
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

      FlutterError.onError =
          FirebaseCrashlytics.instance.recordFlutterFatalError;

      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };

      runApp(const MyApp());
    },
    (error, stackTrace) => FirebaseCrashlytics.instance
        .recordError(error, stackTrace, fatal: true),
  );
}
