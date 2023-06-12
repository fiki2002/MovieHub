import 'package:flutter/material.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page Not Found'),
        ),
        //TODO: Replace to  custom text widget
        body: const Center(
          child: Text('ERROR: Route not found'),
        ),
      );
    },
  );
}
