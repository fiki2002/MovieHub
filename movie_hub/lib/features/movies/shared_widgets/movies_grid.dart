import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
    this.movies,
    required this.genreTitle,
  });

  final List<MovieResultsEntity>? movies;
  final String genreTitle;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies?.length ?? 0,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 111 / 180,
        crossAxisSpacing: kfsTiny,
        mainAxisSpacing: kfsMedium,
      ),
      itemBuilder: (context, int index) {
        final id = '$genreTitle${movies?[index].name}${movies?[index].id}';
        return Hero(
          tag: id,
          child: MovieCardTile(
            imageUrl: movies?[index].posterPath ?? '',
            onTap: () => goTo(
              MovieDetailsScreen.route,
              arguments: MovieDetailsParams(
                genreTitle: genreTitle,
                movieResults: movies?[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
