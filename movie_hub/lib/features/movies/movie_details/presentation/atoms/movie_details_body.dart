import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieInfoAtom extends StatelessWidget {
  const MovieInfoAtom({
    super.key,
    required this.movies,
    required this.movieDetails,
    required this.movieId,
  });
  final MovieDetailsParams movies;
  final MovieDetailModel movieDetails;
  final String movieId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kfsExtraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth * .5,
                    child: TextWidget(
                      movies.movieResults?.originalName ?? '',
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: sp(kfsExtraLarge),
                    ),
                  ),
                  vSpace(kMinute),
                  if (movieDetails.homepage != null) ...[
                    RichTextWidget(
                      'Visit Webpage',
                      '',
                      onTap1: TapGestureRecognizer()
                        ..onTap = () async =>
                            await '${movieDetails.homepage}'.launchInBrowser(),
                      fontWeight: FontWeight.w600,
                      textColor: Colors.blue.withOpacity(.7),
                      fontWeight2: FontWeight.w400,
                    ),
                    vSpace(kSize5),
                  ],
                ],
              ),
              _ActionButtons(movieId),
            ],
          ),
          TextWidget(
            '${movies.movieResults?.overview}',
          ),
          vSpace(kMinute),
          if (movies.movieResults?.mediaType != null) ...[
            RichTextWidget(
              'Media Type:  ',
              '${movies.movieResults?.mediaType}'.capitalize(),
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
          WatchMoviesButton(
            movies: movies,
          ),
          vSpace(kfsTiny),
          SimilarMovies(movieId: movies.movieResults?.id.toString() ?? ''),
          vSpace(kfsTiny),
          ImagesSection(
            movies: movies,
          ),
        ],
      ),
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons(this.movieId);
  final String movieId;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> tapNotifier = ValueNotifier(false);
    return ValueListenableBuilder<bool>(
      valueListenable: tapNotifier,
      builder: (context, isClicked, _) {
        return ElevatedButton(
          onPressed: () {
            tapNotifier.value = !tapNotifier.value;
            context.addToWatchList.addToWatchList(movieId);
          },
          style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(sp(kMinute)),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
          ),
          child: Row(
            children: [
              addIcon.svg,
              hSpace(kMinute),
              TextWidget(isClicked ? 'Remove' : 'Add'),
            ],
          ),
        );
      },
    );
  }
}
