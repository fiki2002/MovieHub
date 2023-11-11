import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String route = '/movie_details';

  const MovieDetailsScreen({super.key, required this.movies});
  final MovieDetailsParams movies;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      safeAreaTop: false,
      usePadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieDetailsHeader(movies: widget.movies),
          _movieTitle(),
        ],
      ),
      useSingleScroll: true,
    );
  }

  Widget _movieTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kfsExtraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            widget.movies.movieResults?.originalName ?? '',
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: sp(kfsExtraLarge),
          ),
          vSpace(kMinute),
          TextWidget(
            '${widget.movies.movieResults?.overview}',
          ),
        ],
      ),
    );
  }
}
