import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class ProfileRepo {
  FutureOr<NotifierState<UserDetailsModel>> fetchProfileDetails();
  FutureOr<NotifierState<List<String>>> fetchAvatars();
  Future<Either<Failure,BaseEntity> > updateAvatar(String avatarUrl);
}
