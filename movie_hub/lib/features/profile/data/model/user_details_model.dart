import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class UserDetailsModel extends UserDetailsEntity {
  const UserDetailsModel({
    super.userName,
    super.avatarUrl,
    super.userId,
    super.email,
  });

  factory UserDetailsModel.fromMap(Mapped json) {
    return UserDetailsModel(
      userName: json['user_name'],
      avatarUrl: json['avatar_url'],
      userId: json['user_id'],
      email: json['email'],
    );
  }
}
