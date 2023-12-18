import 'dart:async';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class SearchMovieImpl extends SearchMoviesRepository {
  final SearchMovieDataSource searchMovieDataSource;

  SearchMovieImpl({
    required this.searchMovieDataSource,
  });

  @override
  FutureOr<Either<Failure, MoviesModel>> discoverMovies(int page) {
    return _handleSearchMovieOperation(
      () => searchMovieDataSource.discoverMovies(page),
    );
  }

  @override
  FutureOr<Either<Failure, MoviesModel>> searchMovies(
    SearchParamsModel params,
  ) {
    return _handleSearchMovieOperation(
      () => searchMovieDataSource.searchMovies(params),
    );
  }

  Future<Either<Failure, T>> _handleSearchMovieOperation<T>(
    Future<T> Function() operation,
  ) async {
    try {
      final T result = await operation();

      return Either.right(result);
    } on SocketFailures {
      return const Left(BaseFailures(message: ErrorText.noInternet));
    } catch (e, s) {
      AppLogger.log(e, s);

      if (e is BaseFailures) {
        return Either.left(BaseFailures(message: e.message));
      }

      return Either.left(BaseFailures(message: e.toString()));
    }
  }
}
