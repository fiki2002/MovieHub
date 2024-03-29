import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class WatchListBodyWidget extends StatelessWidget {
  const WatchListBodyWidget({super.key, required this.movies});
  final List<MovieDetailModel>? movies;
  @override
  Widget build(BuildContext context) {
    return switch (movies?.length.toString() == '0') {
      true => const _EmptyWatchListView(),
      false => _WatchListGrid(movies: movies)
    };
  }
}

class _WatchListGrid extends StatelessWidget {
  const _WatchListGrid({required this.movies});
  final List<MovieDetailModel>? movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies?.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 111 / 180,
        crossAxisSpacing: kfsTiny,
        mainAxisSpacing: kfsMedium,
      ),
      itemBuilder: (context, int index) {
        final movie = movies?[index];
        return Hero(
          tag: 'WatchList${movie?.originalTitle}${movie?.id}',
          child: MovieCardTile(
            imageUrl: movie?.posterPath ?? '',
            onTap: () => goTo(
              MovieDetailsScreen.route,
              arguments: MovieDetailsParams(
                genreTitle: 'WatchList',
                movieResults: MovieResultsEntity(
                  adult: movie?.adult,
                  backdropPath: movie?.backdropPath,
                  name: movie?.originalTitle,
                  id: movie?.id,
                  overview: movie?.overview,
                  posterPath: movie?.posterPath,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _EmptyWatchListView extends StatelessWidget {
  const _EmptyWatchListView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        vSpace(kfs90),
        Center(
          child: Lottie.asset(
            emptyWatchList,
            height: h(200),
            width: w(200),
          ),
        ),
        vSpace(kMinute),
        const TextWidget(
          'You have no movies in your watchlist\nyou sure do wanna add some 😌',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
