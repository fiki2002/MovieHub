import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

abstract class HomeRemoteDataSource {
  Future<ServiceResponse<MoviesModel>> getTrendingMovies(
    String timeWindow,
  );
  Future<ServiceResponse<MoviesModel>> getPopularMovies();
  Future<ServiceResponse<MoviesModel>> getRatedMovies();
  Future<ServiceResponse<MoviesModel>> getUpcomingMovie();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  /// Fetches trending movies for a particular time period
  /// [timeWindow] could be DAY or WEEK.
  @override
  Future<ServiceResponse<MoviesModel>> getTrendingMovies(
    String timeWindow,
  ) async {
    return await _getMovies('/trending/movie/$timeWindow');
  }

  /// Fetches movies ordered by popularity.
  @override
  Future<ServiceResponse<MoviesModel>> getPopularMovies() async {
    return await _getMovies('/movie/popular');
  }

  /// Fetches rated movies.
  @override
  Future<ServiceResponse<MoviesModel>> getRatedMovies() async {
    return await _getMovies('/movie/top_rated');
  }

  ///Fetches upcoming movie
  @override
  Future<ServiceResponse<MoviesModel>> getUpcomingMovie() async {
    return await _getMovies('/movie/upcoming');
  }
}

/// Fetches all Movies of different [tag]
Future<ServiceResponse<MoviesModel>> _getMovies(String tag) {
  return serveFuture<MoviesModel>(
    function: (dynamic Function(String) fail) async {
      final String url = '$baseUrl$tag';
      final result = await HttpHelper.get(url);
      final MoviesModel popularMovies = MoviesModel.fromJson(result);
      return popularMovies;
    },
  );
}
