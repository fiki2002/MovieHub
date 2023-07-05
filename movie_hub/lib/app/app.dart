import 'package:flutter/material.dart';
import 'package:movie_hub/cores/constants/theme.dart';
import 'package:movie_hub/cores/navigator/app_router.dart';
import 'package:movie_hub/cores/navigator/route_generator.dart';
// import 'package:movie_hub/features/onboarding/pages/splash_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieHub',
      // initialRoute: SplashPage.route,
       theme: ThemeClass.lightTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: AppRouter.instance.navigatorKey,
    );
  }
}
