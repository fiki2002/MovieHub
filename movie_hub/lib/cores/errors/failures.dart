import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({
    this.message = "Something Went Wrong, Please Try Again",
    this.trace,
  });

  final String message;
  final StackTrace? trace;

  @override
  List<Object?> get props => [message, trace];
}
