import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchAvatarsUsecase {
  final ProfileRepo _profileRepo;

  FetchAvatarsUsecase({
    required profileRepo,
  }) : _profileRepo = profileRepo;

  Future<NotifierState<List<String>>> execute() async {
    return await _profileRepo.fetchAvatars();
  }
}
