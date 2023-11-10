import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class GenreCardWidget extends StatelessWidget {
  const GenreCardWidget({
    super.key,
    required this.title,
    required this.movies,
  });
  final String title;
  final List<MovieResultsEntity>? movies;
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
              itemBuilder: (context, index) {
                final imageUrl = movies?[index].posterPath ?? '';
                return _MovieCardTile(
                  imageUrl: imageUrl,
                );
              },
              separatorBuilder: (context, index) => hSpace(kMinute),
              itemCount: movies?.length ?? 0,
            ),
          ),
        ],
      ),
    );
  }
}

class _MovieCardTile extends StatelessWidget {
  const _MovieCardTile({required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kXtremeLarge,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kfsTiny),
        color: kcGrey.withOpacity(.3),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kfsTiny),
        child: ImageWidget(
          imageTypes: ImageTypes.network,
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          loader: const ShimmerWidget(),
        ),
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
