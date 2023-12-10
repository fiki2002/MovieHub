import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:movie_hub/cores/constants/palette.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/movies/watchlist/watchlist.dart';
import 'package:movie_hub/features/profile/profile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

/// extension for SVG
///
extension SvgExtension on String {
  /// SVG with color
  SvgPicture get svg => SvgPicture.asset(
        this,
        fit: BoxFit.scaleDown,
        // ignore: deprecated_member_use
        color: kcWhiteColor.withOpacity(0.8),
      );
}

/// extension for logging objects
extension LogExtension<T> on T {
  void log() {
    if (kDebugMode == false) return;
    dev.log(
      '$this',
    );
  }
}

extension Validate on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension DateTimeExtension on DateTime {
  String parse() {
    return DateFormat.yMMMd().format(this);
  }
}

extension UrlLauncherExtension on String {
  Future<void> launchInBrowser() async {
    Uri url = Uri.parse(this);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      'Could not launch $url'.log();
    }
  }
}

/// For validation
extension ValidatingExtensions on String {
  String? validateAnyField({String? field}) {
    if (toString().isEmpty) {
      return '$field field is required ';
    } else {
      return null;
    }
  }

  String? validateEmail() {
    if (toString().isEmpty) {
      return 'Email is required';
    }

    final pattern = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (pattern.hasMatch(this)) {
      return null;
    } else {
      return 'Invalid email';
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    // Your custom password validation logic here
    if (!value.isValidPassword()) {
      return 'Invalid password';
    }

    return null; // Return null if the validation succeeds
  }

  bool isValidPassword() {
    // Password must be at least 8 characters long
    if (length < 6) {
      return false;
    }

    // Password must contain at least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(this)) {
      return false;
    }

    // Password must contain at least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(this)) {
      return false;
    }

    // Password must contain at least one digit
    if (!RegExp(r'[0-9]').hasMatch(this)) {
      return false;
    }

    // Password may contain special characters (you can customize this)
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(this)) {
      return false;
    }

    // If all criteria are met, the password is considered valid
    return true;
  }
}

extension BuildContextNotifier on BuildContext {
  AuthNotifier get auth => Provider.of<AuthNotifier>(this, listen: false);
  UpdateAvatarNotifier get updateAvatar =>
      Provider.of<UpdateAvatarNotifier>(this, listen: false);
  AddToWatchListNotifier get addToWatchList =>
      Provider.of<AddToWatchListNotifier>(this, listen: false);
        RemoveFromWatchListNotifier get removeFromWatchList =>
      Provider.of<RemoveFromWatchListNotifier>(this, listen: false);
  WatchListNotifier get watchListNotifier =>
      Provider.of<WatchListNotifier>(this, listen: false);
  GetWatchListMovieIdsNotifier get getWatchListNotifier =>
      Provider.of<GetWatchListMovieIdsNotifier>(this, listen: false);
  CheckMovieWatchListStatusNotifier get checkWatchListStatus =>
      Provider.of<CheckMovieWatchListStatusNotifier>(this, listen: false);
}
