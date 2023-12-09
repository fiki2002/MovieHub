import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class UpdateAvatarUsecase
    implements UseCaseFuture<Failure, BaseEntity, String> {
  final ProfileRepo _profileRepo;

  UpdateAvatarUsecase({required ProfileRepo profileRepo})
      : _profileRepo = profileRepo;

  @override
  Future<Either<Failure, BaseEntity>> call(String params) async {
    return await _profileRepo.updateAvatar(params);
  }
}
