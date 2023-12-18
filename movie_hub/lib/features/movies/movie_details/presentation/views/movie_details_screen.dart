import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';
import 'package:movie_hub/features/movies/shared_widgets/widgets.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String route = '/movie_details';

  const MovieDetailsScreen({
    super.key,
    required this.movies,
  });
  final MovieDetailsParams movies;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.checkWatchListStatus.isMovieAWatchList(
        (widget.movies.movieResults?.id ?? '').toString(),
      );
      context.movieDetails.getMovieDetails(
        (widget.movies.movieResults?.id ?? '').toString(),
      );
      context.similarMovies.getSimilarMovies(
        (widget.movies.movieResults?.id ?? '').toString(),
      );
      context.images.getImages(
        (widget.movies.movieResults?.id ?? '').toString(),
      );
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      safeAreaTop: false,
      usePadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailsHeader(movies: widget.movies),
          vSpace(kMinute),
          SlideTransition(
            position: _offsetAnimation,
            child: MovieInfo(
              movieId: widget.movies.movieResults?.id.toString() ?? '',
              movies: widget.movies,
            ),
          )
        ],
      ),
      useSingleScroll: true,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
