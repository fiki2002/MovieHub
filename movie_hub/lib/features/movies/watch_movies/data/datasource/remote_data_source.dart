import 'package:movie_hub/cores/cores.dart';

abstract class WatchMoviesRemoteDataSource {
  Future<ServiceResponse<String>> watchMovies(String movieId);
}

class WatchMoviesRemoteDataSourceImpl extends WatchMoviesRemoteDataSource {
  @override
  Future<ServiceResponse<String>> watchMovies(String movieId) async {
    return serveFuture<String>(
      function: (dynamic Function(String) fail) async {
        final String url = '$videoBaseUrl$movieId';
        final result = await HttpHelper.getString(url);
        return result;
      },
    );
  }
}
