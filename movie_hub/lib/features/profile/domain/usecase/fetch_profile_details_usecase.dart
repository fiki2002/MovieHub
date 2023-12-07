import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchProfileDetailsUsecase {
  final ProfileRepo _profileRepo;

  FetchProfileDetailsUsecase({
    required profileRepo,
  }) : _profileRepo = profileRepo;

  Future<NotifierState<UserDetailsModel>> execute() async {
    return await _profileRepo.fetchProfileDetails();
  }
}
