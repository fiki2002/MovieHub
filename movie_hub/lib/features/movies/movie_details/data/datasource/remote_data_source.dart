import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/data/model/movie_details_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<ServiceResponse<MovieDetailModel>> getMovieDetails(String movieId);
}

class MovieDetailRemoteDataSourceImpl extends MovieDetailsRemoteDataSource {
  @override
  Future<ServiceResponse<MovieDetailModel>> getMovieDetails(String movieId) {
    return serveFuture<MovieDetailModel>(
      function: (dynamic Function(String) fail) async {
        final String url = '$baseUrl/movie/$movieId';
        final result = await HttpHelper.get(url);
        result.log();
        final MovieDetailModel movieDetail = MovieDetailModel.fromJson(result);
        return movieDetail;
      },
    );
  }
}
