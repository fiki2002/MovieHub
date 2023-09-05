import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/cores/navigator/app_router.dart';
import 'package:movie_hub/features/movie_dashboard/nav_bar/change_notifier/nav_bar_notifier.dart';
import 'package:movie_hub/features/splash/splash_page.dart';
import 'package:movie_hub/cores/navigator/route_generator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

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
          providers: _providers,
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

List<SingleChildWidget> _providers = [
  ChangeNotifierProvider.value(value: NavBarNotifier()),
];
