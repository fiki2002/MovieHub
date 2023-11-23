import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({
    super.key,
    required this.movieId,
    required this.movies,
  });
  final String movieId;
  final MovieDetailsParams movies;

  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final s = getIt<MovieDetailUsecase>();
        return MovieDetailsNotifier(
          movieDetailsUsecase: s,
          movieId: widget.movieId,
        );
      },
      child: Consumer<MovieDetailsNotifier>(
        builder: (context, movieDetailsNotifier, _) {
          return movieDetailsNotifier.state.when(
            done: (MovieDetailModel movieDetails) {
              return MovieInfoAtom(
                movies: widget.movies,
                movieDetails: movieDetails,
              );
            },
            error: (_) => const Text(''),
            loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        },
      ),
    );
  }
}
