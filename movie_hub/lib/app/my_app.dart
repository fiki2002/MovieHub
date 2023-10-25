import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/splash/splash.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, Widget? child) {
        return MultiProvider(
          providers: providers,
          child: MaterialApp(
            title: 'Movie Hub',
            debugShowCheckedModeBanner: false,
            initialRoute: SplashPage.route,
            theme: ThemeData(
              scaffoldBackgroundColor: kcBackground,
            ),
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: AppRouter.instance.navigatorKey,
          ),
        );
      },
    );
  }
}

