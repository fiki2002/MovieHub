import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileDataSource _profileDataSource;
  ProfileRepoImpl({required profileDataSource})
      : _profileDataSource = profileDataSource;
  @override
  FutureOr<NotifierState<UserDetailsModel>> fetchProfileDetails() {
    return convert(
      () => _profileDataSource.fetchProfileDetails(),
    );
  }

  @override
  FutureOr<NotifierState<List<String>>> fetchAvatars() {
    return convert(
      () => _profileDataSource.getAvatars(),
    );
  }

  @override
  Future<Either<Failure, BaseEntity>> updateAvatar(String avatarUrl) async {
    try {
      final BaseModel result =
          await _profileDataSource.updateAvatarUrl(avatarUrl);

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
