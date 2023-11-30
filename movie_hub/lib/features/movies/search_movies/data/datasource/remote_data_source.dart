import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class SearchMovieDataSource {
  Future<ServiceResponse<MoviesModel>> discoverMovies(int page);
  Future<ServiceResponse<MoviesModel>> searchMovies(SearchParamsModel params);
}

class SearchMovieDataSourceImpl extends SearchMovieDataSource {
  @override
  Future<ServiceResponse<MoviesModel>> discoverMovies(int page) {
    /// Fetches random movies that'd be under the Discover section
    return serveFuture<MoviesModel>(
      function: (dynamic Function(String) fail) async {
        final String url = '$baseUrl/discover/movie';
        final result = await HttpHelper.get(
          url,
          query: {
            'page': page,
          },
        );
        final MoviesModel discoverMovies = MoviesModel.fromJson(result);
        return discoverMovies;
      },
    );
  }

  @override
  Future<ServiceResponse<MoviesModel>> searchMovies(SearchParamsModel params) {
    //searches through movies
    return serveFuture<MoviesModel>(
      function: (dynamic Function(String) fail) async {
        final String url = '$baseUrl/search/movie';
        final result = await HttpHelper.get(
          url,
          query: {
            'query': params.query,
            'page': params.page,
          },
        );
        final MoviesModel searchedMovies = MoviesModel.fromJson(result);
        return searchedMovies;
      },
    );
  }
}
