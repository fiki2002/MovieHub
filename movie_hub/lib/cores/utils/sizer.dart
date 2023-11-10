import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/cores.dart';

/// return a percentage of the screen height in respect to the  value given
double sh(double value) => (value / 100).sh;

/// return a percentage of the screen width in respect to the  value given
double sw(double value) => (value / 100).sw;

/// Calculates the sp (Scalable Pixel) depending on the device's screen size
double sp(double value) => value.sp;

double h(double value) => value.h;

double w(double value) => value.w;

double sr(double value) => value.r;

Widget vSpace(double value) => value.verticalSpace;

Widget hSpace(double value) => value.horizontalSpace;

double get screenWidth =>
    MediaQuery.sizeOf(navigatorKey.currentState!.context).width;

double get screenHeight =>
    MediaQuery.sizeOf(navigatorKey.currentState!.context).height;
