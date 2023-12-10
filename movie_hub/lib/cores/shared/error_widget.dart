import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/cores/cores.dart';

class PageErrorWidget extends StatelessWidget {
  const PageErrorWidget({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          vSpace(screenHeight * .1),
          Lottie.asset(loadingFailed),
          AnimatedOpacity(
            opacity: 1,
            duration: const Duration(milliseconds: 400),
            child: Column(
              children: [
                const Center(
                  child: TextWidget(
                    'Something went wrong!😓\nYou should check your internet connection',
                    textAlign: TextAlign.center,
                  ),
                ),
                vSpace(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Button(
                    text: 'Retry',
                    onTap: onTap,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
