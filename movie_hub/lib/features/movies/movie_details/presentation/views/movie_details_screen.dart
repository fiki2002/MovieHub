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

class _MovieDetailsScreenState extends State<MovieDetailsScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
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
          _movieTitle(),
        ],
      ),
      useSingleScroll: true,
    );
  }

  Widget _movieTitle() {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
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
            vSpace(kMinute),
            if (widget.movies.movieResults?.mediaType != null) ...[
              RichTextWidget(
                'Media Type:  ',
                '${widget.movies.movieResults?.mediaType}'.capitalize(),
                fontWeight: FontWeight.w500,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
