import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class SearchMovieDataSource {
  Future<MoviesModel> discoverMovies(int page);
  Future<MoviesModel> searchMovies(SearchParamsModel params);
}

class SearchMovieDataSourceImpl extends SearchMovieDataSource {
  @override
  Future<MoviesModel> discoverMovies(int page) async {
    /// Fetches random movies that'd be under the Discover section
    final String url = '$baseUrl/discover/movie';
    final result = await HttpHelper.get(
      url,
      query: {
        'page': page,
      },
    );
    final MoviesModel discoverMovies = MoviesModel.fromJson(result);
    return discoverMovies;
  }

  @override
  Future<MoviesModel> searchMovies(SearchParamsModel params) async {
    //searches through movies
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
  }
}
