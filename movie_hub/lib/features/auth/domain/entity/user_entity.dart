import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? email;
  final String? userName;
  final String? userId;

  const UserEntity({
    this.email,
    this.userName,
    this.userId,
  });
  
  @override
  List<Object?> get props => [email, userName, userId];
}
