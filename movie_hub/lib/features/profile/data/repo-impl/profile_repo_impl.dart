import 'dart:async';

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
}
