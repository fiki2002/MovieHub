import 'package:flutter/cupertino.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class WatchMoviesButton extends StatelessWidget {
  const WatchMoviesButton({super.key, required this.movies});
  final MovieDetailsParams movies;
  @override
  Widget build(BuildContext context) {
    return Button(
      text: 'Watch',
      circular: true,
      onTap: () => goTo(
        WatchMoviesView.route,
        arguments: movies.movieResults?.id.toString() ?? '',
      ),
    );
  }
}
