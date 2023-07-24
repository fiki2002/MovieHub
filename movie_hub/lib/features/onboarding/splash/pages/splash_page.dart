import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/app_bar_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const route = 'splash_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            AppBarWidget(
              title: 'Fuck ooff',
              showBackButton: false,
              useSpacer: true,
            ),
          ],
        ),
      ),
    );
  }
}
