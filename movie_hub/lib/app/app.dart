import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/cores/navigator/app_router.dart';
import 'package:movie_hub/cores/navigator/route_generator.dart';
import 'package:movie_hub/features/onboarding/splash/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, Widget? child) {
        return MaterialApp(
          title: 'Movie Hub',
          debugShowCheckedModeBanner: false,
          initialRoute: SplashPage.route,
          theme: ThemeClass.lightTheme,
          darkTheme: ThemeClass.darkTheme,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: AppRouter.instance.navigatorKey,
        );
      },
    );
  }
}
