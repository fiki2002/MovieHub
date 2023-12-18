import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<MovieDetailModel> getMovieDetails(String movieId);
  Future<ImageModel> getImages(String movieId);
  Future<MoviesModel> getSimilarMovies(String movieId);
  Future<bool> checkIfMovieIdHasBeenWatchListed(String movieId);
}

class MovieDetailRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  
  final FirebaseHelper _firebaseHelper;

  MovieDetailRemoteDataSourceImpl({
    required FirebaseHelper firebaseHelper,
  }) : _firebaseHelper = firebaseHelper;

  @override
  Future<bool> checkIfMovieIdHasBeenWatchListed(String movieId) async {
    final String? userId = _firebaseHelper.currentUserId;

    final AggregateQuerySnapshot aggregateQuerySnapshot = await _firebaseHelper
        .watchListRef(userId: userId ?? '')
        .where("movie_id", isEqualTo: movieId)
        .count()
        .get(source: AggregateSource.server);

    final int count = aggregateQuerySnapshot.count;

    if (count > 0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<ImageModel> getImages(String movieId) async {
    final String url = '$baseUrl/movie/$movieId/images';
    final result = await HttpHelper.get(url);
    final ImageModel images = ImageModel.fromJson(result);
    return images;
  }

  @override
  Future<MovieDetailModel> getMovieDetails(String movieId) async {
    final String url = '$baseUrl/movie/$movieId';
    final result = await HttpHelper.get(url);

    final MovieDetailModel movieDetail = MovieDetailModel.fromJson(result);
    return movieDetail;
  }

  @override
  Future<MoviesModel> getSimilarMovies(String movieId) async {
    final String url = '$baseUrl/movie/$movieId/similar';
    final result = await HttpHelper.get(url);
    final MoviesModel similarImages = MoviesModel.fromJson(result);
    return similarImages;
  }
}
