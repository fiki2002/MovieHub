import 'dart:async';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class GetUpcomingMoviesUseCase implements UseCaseFuture<Failure, MoviesModel, int> {
  final HomeRepository homeRepository;

  GetUpcomingMoviesUseCase({
    required this.homeRepository,
  });
  
  @override
  FutureOr<Either<Failure, MoviesModel>> call(int params) async{
     return await homeRepository.getUpcomingMovies(params);

  }
}
