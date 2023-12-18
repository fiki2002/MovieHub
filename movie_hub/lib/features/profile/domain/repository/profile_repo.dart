import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UserDetailsModel>> fetchProfileDetails();
  Future<Either<Failure, List<String>>> fetchAvatars();
  Future<Either<Failure, BaseEntity>> updateAvatar(String avatarUrl);
}
