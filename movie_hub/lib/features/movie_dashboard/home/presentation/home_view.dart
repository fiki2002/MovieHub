import 'package:flutter/material.dart';
import 'package:movie_hub/cores/components/scaffold_widget.dart';
import 'package:movie_hub/cores/components/text_widget.dart';
import 'package:movie_hub/cores/components/textfield_widget.dart';
import 'package:movie_hub/cores/constants/asset.dart';
import 'package:movie_hub/cores/constants/font_size.dart';
import 'package:movie_hub/cores/utils/extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const route = 'home';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextWidget(
            'Welcome',
            fontWeight: FontWeight.w600,
            fontSize: kfsLarge,
          ),
          kMinute.sH,
          CustomTextField(
            hintText: 'Search movies',
            suffixIcon: searchIcon.svg,
          ),
          kfsExtraLarge.sH,
          const TextWidget(
            'TRENDING',
            fontWeight: FontWeight.w500,
            fontSize: kfsTiny,
          ),
        ],
      ),
      useSingleScroll: true,
    );
  }
}
