import 'package:flutter/material.dart';
import 'package:movie_hub/app/my_app.dart';
import 'package:movie_hub/app/locator.dart';
import 'package:movie_hub/cores/cores.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SetUpLocators.init();

  await Setups.run();

  runApp(const MyApp());
  
}
