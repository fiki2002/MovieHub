import 'package:equatable/equatable.dart';
import 'package:movie_hub/features/auth/auth.dart';

class AuthResultEntity extends Equatable {
  final bool success;
  final String message;
  final UserEntity? user;

  const AuthResultEntity({
    required this.success,
    required this.message,
    this.user,
  });
  
  @override
  List<Object?> get props => throw UnimplementedError();
}
