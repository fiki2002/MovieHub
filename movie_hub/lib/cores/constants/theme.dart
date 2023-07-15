import 'package:flutter/material.dart';

// const Color kcDarkTextColor = Color(0xff121111);
const Color kcTextColor = Color(0xff000000);
const Color kcBackgroundColor = Color(0xffffffff);
const Color kcPrimaryColor = Color(0xff272727);
const Color kcGreyLight = Color(0xffEEEEEE);
const Color kcGrey400 = Color(0xffBDBDBD);
const Color kcGrey600 = Color(0xff757575);
const Color kcGrey800 = Color(0xff424242);
const Color kcGrey200 = Color(0xffEEEEEE);
const Color kcGrey100 = Color(0xffF5F5F5);
const Color kcDarkBackground = Color(0xFF121212);
const Color kcWhite = Color(0xFFFFFFFF);
const Color kcSuccessColor = Color(0xff15DC71);
const Color kcErrorColor = Color(0xffFF0202);
final Color kcSoftTextColor = const Color(0xff2C2C2C).withOpacity(0.6);

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: kcBackgroundColor ,
    primaryColor: kcPrimaryColor,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(primary: kcPrimaryColor)
        .copyWith(error: kcErrorColor),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: kcPrimaryColor,
    textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
    colorScheme: const ColorScheme.dark(primary: kcPrimaryColor)
        .copyWith(error: kcErrorColor),
  );
}

// Theme Checker
extension DarkMode on BuildContext {
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}
