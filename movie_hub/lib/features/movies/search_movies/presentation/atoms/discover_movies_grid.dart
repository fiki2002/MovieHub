import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class DiscoverMoviesGrid extends StatelessWidget {
  const DiscoverMoviesGrid({super.key, this.movies});
  final List<MovieResultsEntity>? movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: movies?.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 111 / 161,
          crossAxisSpacing: kfsTiny,
          mainAxisSpacing: kfsMedium,
        ),
        itemBuilder: (context, int index) {
          return Hero(
            tag: 'Discover${movies?[index].name}${movies?[index].id}',
            child: MovieCardTile(
              imageUrl: movies?[index].posterPath ?? '',
              onTap: () => goTo(
                MovieDetailsScreen.route,
                arguments: MovieDetailsParams(
                  genreTitle: 'Discover',
                  movieResults: movies?[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
