import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/text_widget.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const TextWidget('Page Not Found'),
        ),
        body: const Center(
          child: TextWidget('ERROR! Page not found'),
        ),
      );
    },
  );
}
