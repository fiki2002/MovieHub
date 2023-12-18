import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';
import 'package:movie_hub/features/movies/shared_widgets/movies_grid.dart';

class SeeAllMovies extends StatefulWidget {
  static const String route = '/see-all-movies';

  const SeeAllMovies({
    super.key,
    required this.params,
  });

  final SeeAllParams params;

  @override
  State<SeeAllMovies> createState() => _SeeAllMoviesState();
}

class _SeeAllMoviesState extends State<SeeAllMovies> {
  bool shouldTriggerRebuild = false;
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: kcBackground,
        elevation: 0,
        title: TextWidget(
          widget.params.genreTitle,
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
            widget.params.handleNotification(notification);
            setState(() {
              shouldTriggerRebuild = false;
            });

            return true;
          },
          child: MoviesGrid(
            movies: widget.params.movies,
            genreTitle: 'SEE ALL${widget.params.genreTitle}',
          ),
        ),
      ),
      useSingleScroll: false,
      usePadding: false,
    );
  }
}
