import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class MovieDetailRepoImpl extends MovieDetailRepository {
  final MovieDetailsRemoteDataSource movieDetailsDataSource;
  MovieDetailRepoImpl({
    required this.movieDetailsDataSource,
  });

  @override
  FutureOr<NotifierState<MovieDetailModel>> getMovieDetails(String movieId) {
    return convertWithArgument(
      movieDetailsDataSource.getMovieDetails,
      movieId,
    );
  }

  @override
  FutureOr<NotifierState<ImageModel>> getImages(String movieId) {
    return convertWithArgument(
      movieDetailsDataSource.getImages,
      movieId,
    );
  }
}
