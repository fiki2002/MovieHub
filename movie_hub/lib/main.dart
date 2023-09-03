import 'package:flutter/material.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/app/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SetUpLocators.init();

  runApp(const MyApp());
}
