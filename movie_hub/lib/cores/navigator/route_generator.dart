import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/splash/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final Object? args = settings.arguments;

    switch (settings.name) {
      case SplashPage.route:
        return pageRoute(const SplashPage());
      case SignUpView.route:
        return pageRoute(const SignUpView());
      case HomeView.route:
        return pageRoute(const HomeView());
      case SignInView.route:
        return pageRoute(const SignInView());
      case ForgotPasswordView.route:
        return pageRoute(const ForgotPasswordView());
      case NavBarView.route:
        return pageRoute(const NavBarView());
      case MovieDetailsScreen.route:
        return pageRoute(const MovieDetailsScreen());

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
