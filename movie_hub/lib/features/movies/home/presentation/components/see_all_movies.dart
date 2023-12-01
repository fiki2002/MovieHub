import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SeeAllMovies extends StatelessWidget {
  static const String route = '/see-all-movies';

  const SeeAllMovies({
    super.key,
    required this.params,
  });

  final SeeAllParams params;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: kcBackground,
        elevation: 0,
        title: TextWidget(
          params.genreTitle,
          fontWeight: FontWeight.w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          kfsExtraLarge,
          kfsExtraLarge,
          kfsExtraLarge,
          0,
        ),
        child: NotificationListener(
          onNotification: (Notification notification) {
            params.handleNotification(notification);

            return true;
          },
          child: MoviesGrid(
            movies: params.movies,
            genreTitle: params.genreTitle,
          ),
        ),
      ),
      useSingleScroll: false,
      usePadding: false,
    );
  }
}
