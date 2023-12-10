import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_details/movie_details.dart';

class CheckIfMovieIsAUsecase
    implements UseCaseFuture<Failure, bool, String> {
  final MovieDetailRepository _movieDetailRepo;

  CheckIfMovieIsAUsecase({
    required MovieDetailRepository movieDetailRepo,
  }) : _movieDetailRepo = movieDetailRepo;

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await _movieDetailRepo.isMovieAWatchList(params);
  }
}
