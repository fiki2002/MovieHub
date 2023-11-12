import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_hub/app/app.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/movies/movie_details/presentation/notifier/similar_movies_notifier.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final GetIt getIt = SetUpLocators.getIt;

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
    return ChangeNotifierProvider(
      create: (context) {
        final s = getIt<MovieDetailUsecase>();
        return MovieDetailsNotifier(
          movieDetailsUsecase: s,
          movieId: widget.movies.movieResults?.id.toString() ?? '',
        );
      },
      child: Consumer<MovieDetailsNotifier>(
        builder: (context, movieDetailsNotifier, _) {
          return movieDetailsNotifier.state.when(
            done: (MovieDetailModel movieDetails) {
              return _body(movieDetails);
            },
            error: (_) => const Text(''),
            loading: () => const CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _body(MovieDetailModel movieDetails) {
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
            if (movieDetails.homepage != null) ...[
              RichTextWidget(
                'Visit Webpage',
                '',
                onTap1: TapGestureRecognizer()
                  ..onTap = () async =>
                      await _launchURLInBrowser('${movieDetails.homepage}'),
                fontWeight: FontWeight.w600,
                textColor: Colors.blue.withOpacity(.7),
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            TextWidget(
              '${widget.movies.movieResults?.overview}',
            ),
            vSpace(kMinute),
            if (widget.movies.movieResults?.mediaType != null) ...[
              RichTextWidget(
                'Media Type:  ',
                '${widget.movies.movieResults?.mediaType}'.capitalize(),
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            if (movieDetails.genres != null) ...[
              RichTextWidget(
                'Genre:  ',
                '${movieDetails.genres?.map((genre) => genre.name?.capitalize()).join(', ')}',
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            if (movieDetails.tagline != null) ...[
              RichTextWidget(
                'Tagline:   ',
                '${movieDetails.tagline}',
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            if (movieDetails.releaseDate != null) ...[
              RichTextWidget(
                'Release Date:   ',
                movieDetails.releaseDate!.parse(),
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            if (movieDetails.productionCompanies != null) ...[
              RichTextWidget(
                'Production Country:  ',
                '${movieDetails.productionCountries?.map((c) => c.name?.capitalize()).join(', ')}',
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            if (movieDetails.productionCompanies != null) ...[
              RichTextWidget(
                'Companies:  ',
                '${movieDetails.productionCompanies?.map((c) => c.name?.capitalize()).join(', ')}',
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
              vSpace(kSize5),
            ],
            if (movieDetails.spokenLanguages != null) ...[
              RichTextWidget(
                'Languages:  ',
                '${movieDetails.spokenLanguages?.map((c) => c.name?.capitalize()).join(', ')}',
                fontWeight: FontWeight.w600,
                fontWeight2: FontWeight.w400,
              ),
            ],
            vSpace(kfsTiny),
            _similarMovies,
            vSpace(kfsTiny),
            _images(),
          ],
        ),
      ),
    );
  }

  Widget _images() {
    return ChangeNotifierProvider(
      create: (context) {
        final s = getIt<ImagesUsecase>();
        return ImageNotifier(
          imageUsecase: s,
          movieId: widget.movies.movieResults?.id.toString() ?? '',
        );
      },
      child: Consumer<ImageNotifier>(
        builder: (context, imageNotifier, _) {
          return imageNotifier.state.when(
            done: (images) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (images.backdrops != [] || images.backdrops != null)
                    const TextWidget(
                      'Images',
                      fontWeight: FontWeight.w700,
                    ),
                  vSpace(kfsTiny),
                  GridViewWidget(
                    list: images.backdrops ?? [],
                  ),
                ],
              );
            },
            error: (e) => Text(e ?? ''),
            loading: CircularProgressIndicator.adaptive,
          );
        },
      ),
    );
  }

  /// To launch the page in web
  Future<void> _launchURLInBrowser(final String path) async {
    Uri url = Uri.parse(path);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      'Could not launch $url'.log();
    }
  }

  Widget get _similarMovies {
    return ChangeNotifierProvider(
      create: (context) {
        final s = getIt<SimilarMovieUsecase>();
        return SimilarMoviesNotifier(
          similarMovieUsecase: s,
          movieId: widget.movies.movieResults?.id.toString() ?? '',
        );
      },
      child: Consumer<SimilarMoviesNotifier>(
        builder: (context, similarMovieNotifier, _) {
          return similarMovieNotifier.state.when(
            done: (similarMovies) => GenreCardWidget(
              padding: EdgeInsets.zero,
              title: 'Similar Movies',
              movies: similarMovies.results,
              fontWeight: FontWeight.w700,
            ),
            error: (e) => Text(e ?? ""),
            loading: () => const CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
