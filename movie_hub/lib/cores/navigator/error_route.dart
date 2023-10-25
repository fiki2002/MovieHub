import 'package:flutter/material.dart';
import 'package:movie_hub/cores/shared/text_widget.dart';
import 'package:movie_hub/cores/constants/palette.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kcBackground,
          title: const TextWidget('Page Not Found'),
        ),
        body: const Center(
          child: TextWidget('ERROR! Page not found'),
        ),
      );
    },
  );
}
