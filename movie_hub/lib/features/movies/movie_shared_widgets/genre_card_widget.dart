import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';

class GenreCardWidget extends StatelessWidget {
  const GenreCardWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kfsMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GenreTitle(genreTitle: title),
          vSpace(kMinute),
          SizedBox(
            height: screenHeight * .15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const _MovieCardTile(),
              separatorBuilder: (context, index) => hSpace(kMinute),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieCardTile extends StatelessWidget {
  const _MovieCardTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kXtremeLarge,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kfsTiny),
        color: kcGrey.withOpacity(.3),
      ),
    );
  }
}

class _GenreTitle extends StatelessWidget {
  const _GenreTitle({
    required this.genreTitle,
  });
  final String genreTitle;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      genreTitle,
      fontSize: sp(kfsTiny),
      fontWeight: FontWeight.w500,
    );
  }
}
