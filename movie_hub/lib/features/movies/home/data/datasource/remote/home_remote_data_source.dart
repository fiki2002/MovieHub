import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/home/home.dart';

abstract class HomeRemoteDataSource {
  Future<ServiceResponse<TrendingMoviesModel>> getTrendingMovies(
      String timeWindow);
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  /// Fetches trending movies for a particular time period
  /// [timeWindow] could be DAY or WEEK
  @override
  Future<ServiceResponse<TrendingMoviesModel>> getTrendingMovies(
      String timeWindow) {
    return serveFuture<TrendingMoviesModel>(
      function: (dynamic Function(String) fail) async {
        final String url = '$baseUrl/movie/$timeWindow';
        final result = await HttpHelper.get(url);
        final TrendingMoviesModel trendingMovies =
            TrendingMoviesModel.fromJson(result);
        trendingMovies.log();
        print(trendingMovies.toJson());
        return trendingMovies;
      },
    );
  }
}
