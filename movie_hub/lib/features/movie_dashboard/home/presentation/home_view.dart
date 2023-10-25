import 'package:flutter/material.dart';
import 'package:movie_hub/cores/shared/shared.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const route = 'home';

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ImageWidget()
        ],
      ),
      useSingleScroll: true,
    );
  }
}
