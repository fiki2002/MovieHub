import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/constants/palette.dart';

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
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offset = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackground,
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
                  fontSize: 90.w,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
