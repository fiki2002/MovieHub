import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

abstract class SearchMovieDataSource {
  Future<ServiceResponse<MoviesModel>> discoverMovies();
}

class SearchMovieDataSourceImpl extends SearchMovieDataSource {
  @override
  Future<ServiceResponse<MoviesModel>> discoverMovies() {
    /// Fetches random movies that'd be under the Discover section
    return serveFuture<MoviesModel>(
      function: (dynamic Function(String) fail) async {
        final String url = '$baseUrl/discover/movie';
        final result = await HttpHelper.get(url);
        final MoviesModel discoverMovies = MoviesModel.fromJson(result);
        return discoverMovies;
      },
    );
  }
}
