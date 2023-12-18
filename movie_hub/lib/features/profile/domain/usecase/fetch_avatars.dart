import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchAvatarsUsecase
    implements UseCaseFuture<Failure, List<String>, NoParams> {
  final ProfileRepo _profileRepo;

  FetchAvatarsUsecase({
    required profileRepo,
  }) : _profileRepo = profileRepo;

  @override
  FutureOr<Either<Failure, List<String>>> call(NoParams params) async {
    return await _profileRepo.fetchAvatars();
  }
}
