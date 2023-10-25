import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const route = 'splash_page';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  double targetValue = 1.0;

  late AnimationController _controller;
  late Animation<Offset> _offset;
  @override
  void initState() {
    super.initState();
    animationCalls();
    timerForSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: _offset,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: targetValue),
            duration: const Duration(milliseconds: 2000),
            curve: Curves.easeIn,
            builder: (context, double val, child) {
              return Opacity(
                opacity: val,
                child: TextWidget(
                  'Flick',
                  fontFamily: 'Sacramento',
                  textColor: kcWhiteColor,
                  fontSize: w(kfs90),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Controls the Animation of the Page
  void animationCalls() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offset = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _controller.forward();
  }

  /// Determines the time spent on splash screen
  void timerForSplashScreen() {
    Timer(
      const Duration(seconds: 3),
      () => goReplace(SignUpView.route),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
