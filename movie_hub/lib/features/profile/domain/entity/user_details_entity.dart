import 'package:equatable/equatable.dart';

class UserDetailsEntity extends Equatable {
  final String? userName;
  final String? avatarUrl;
  final String? userId;
  final String? email;
  const UserDetailsEntity({
    this.userName,
    this.avatarUrl,
    this.userId,
    this.email,
  });
  @override
  List<Object?> get props => [userId, userName, avatarUrl, email];
}
