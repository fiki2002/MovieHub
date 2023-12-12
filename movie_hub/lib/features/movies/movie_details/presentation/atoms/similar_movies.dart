import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:provider/provider.dart';

class SimilarMovies extends StatefulWidget {
  const SimilarMovies({super.key, required this.movieId});
  final String movieId;

  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.similarMovies.init(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SimilarMoviesNotifier>(
      builder: (context, similarMovieNotifier, _) {
        return similarMovieNotifier.state.when(
          done: (similarMovies) {
            return Visibility(
              visible: similarMovies.results?.isNotEmpty ?? true,
              child: GenreCardWidget(
                padding: EdgeInsets.zero,
                title: 'Similar Movies',
                movies: similarMovies.results,
                fontWeight: FontWeight.w700,
              ),
            );
          },
          error: (e) => Text(e ?? ""),
          loading: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
        );
      },
    );
  }
}
