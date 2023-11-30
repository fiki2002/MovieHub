import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/cores/cores.dart';

class MovieNotFound extends StatelessWidget {
  const MovieNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(notFoundLottie),
      ],
    );
  }
}
