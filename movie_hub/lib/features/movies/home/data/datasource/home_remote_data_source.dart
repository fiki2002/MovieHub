import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

abstract class HomeRemoteDataSource {
  Future<ServiceResponse<MoviesModel>> getTrendingMovies(
    String timeWindow,
    int page,
  );
  Future<ServiceResponse<MoviesModel>> getPopularMovies(int page);
  Future<ServiceResponse<MoviesModel>> getRatedMovies(int page);
  Future<ServiceResponse<MoviesModel>> getUpcomingMovie(int page);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  /// Fetches trending movies for a particular time period
  /// [timeWindow] could be DAY or WEEK.
  @override
  Future<ServiceResponse<MoviesModel>> getTrendingMovies(
    String timeWindow,
    int page,
  ) async {
    return await _getMovies('/trending/movie/$timeWindow', page);
  }

  /// Fetches movies ordered by popularity.
  @override
  Future<ServiceResponse<MoviesModel>> getPopularMovies(int page) async {
    return await _getMovies('/movie/popular', page);
  }

  /// Fetches rated movies.
  @override
  Future<ServiceResponse<MoviesModel>> getRatedMovies(int page) async {
    return await _getMovies('/movie/top_rated', page);
  }

  ///Fetches upcoming movie
  @override
  Future<ServiceResponse<MoviesModel>> getUpcomingMovie(int page) async {
    return await _getMovies('/movie/upcoming', page);
  }
}

/// Fetches all Movies of different [tag]
Future<ServiceResponse<MoviesModel>> _getMovies(String tag, int page) {
  return serveFuture<MoviesModel>(
    function: (dynamic Function(String) fail) async {
      
      final String url = '$baseUrl$tag';
      final result = await HttpHelper.get(url, query: {
        'page': page,
      });
      final MoviesModel popularMovies = MoviesModel.fromJson(result);
      return popularMovies;
    },
  );
}
