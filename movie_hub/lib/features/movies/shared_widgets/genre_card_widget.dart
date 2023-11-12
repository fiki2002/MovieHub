import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class GenreCardWidget extends StatelessWidget {
  const GenreCardWidget({
    super.key,
    required this.title,
    required this.movies,
    this.padding,
    this.fontWeight,
  });
  final String title;
  final List<MovieResultsEntity>? movies;
  final EdgeInsets? padding;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(kfsMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _GenreTitle(
            genreTitle: title,
            fontWeight: fontWeight,
          ),
          vSpace(kMinute),
          SizedBox(
            height: screenHeight * .15,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final imageUrl = movies?[index].posterPath ?? '';
                final id = '$title${movies?[index].name}${movies?[index].id}';
                return Hero(
                  tag: id,
                  child: MovieCardTile(
                    imageUrl: imageUrl,
                    onTap: () => goTo(
                      MovieDetailsScreen.route,
                      arguments: MovieDetailsParams(
                        genreTitle: title,
                        movieResults: movies?[index],
                      ),
                    ),
                  ),
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

class _GenreTitle extends StatelessWidget {
  const _GenreTitle({
    required this.genreTitle,
    this.fontWeight,
  });
  final String genreTitle;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      genreTitle,
      fontSize: sp(kfsTiny),
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}

class MovieDetailsParams {
  final MovieResultsEntity? movieResults;
  final String genreTitle;
  MovieDetailsParams({
    required this.movieResults,
    required this.genreTitle,
  });
}
