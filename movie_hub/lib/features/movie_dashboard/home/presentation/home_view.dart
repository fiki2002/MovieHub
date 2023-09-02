import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/scaffold_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const route = 'home';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(),
      useSingleScroll: true,
    );
  }
}
