import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/navigator/error_route.dart';
import 'package:movie_hub/features/auth/sign_up/presentation/sign_up_view.dart';
import 'package:movie_hub/features/movie_dashboard/home/presentation/home_view.dart';
import 'package:movie_hub/features/splash/pages/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case SplashPage.route:
        return pageRoute(const SplashPage());
      case SignUpView.route:
        return pageRoute(const SignUpView());
      case HomeView.route:
        return pageRoute(const HomeView());
      default:
        return errorRoute();
    }
  }

  static PageRoute pageRoute(Widget page) {
    if (!kIsWeb && Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => page);
    }

    return MaterialPageRoute(builder: (_) => page);
  }
}
