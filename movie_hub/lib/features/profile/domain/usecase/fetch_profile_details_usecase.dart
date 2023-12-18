import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchProfileDetailsUsecase
    implements UseCaseFuture<Failure, UserDetailsModel, NoParams> {
  final ProfileRepo _profileRepo;

  FetchProfileDetailsUsecase({
    required profileRepo,
  }) : _profileRepo = profileRepo;

  @override
  FutureOr<Either<Failure, UserDetailsModel>> call(NoParams params) async {
    return await _profileRepo.fetchProfileDetails();
  }
}
