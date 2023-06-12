import 'package:flutter/material.dart';
import 'package:movie_hub/cores/navigator/navigator.dart';
import 'package:movie_hub/features/onboarding/pages/splash_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MovieHub',
      initialRoute: SplashPage.route,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
