import 'dart:async';

import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class ProfileRepo {
  FutureOr<NotifierState<UserDetailsModel>> fetchProfileDetails();
}
