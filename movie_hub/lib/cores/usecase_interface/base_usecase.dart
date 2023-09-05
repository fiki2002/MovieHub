import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// `UseCase` for getting data with Future.
///
/// Use case contains the app's business logic / rules, e.g. validations.
/// It should be independent from any other non-business logic-related
/// functionalities.
///
/// It can be connected with repository, although not every use case needs to
/// depend on the repository.
///
/// If you can live with less static typing, you can use `Params` type
/// as Params.
///
///Where Params are the Objects passed into the
abstract class UseCaseFuture<Failure, Type, Params> {
  /// Method to calling this useCase
  FutureOr<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseVoid<Failure, Params> {
  /// Method to calling this useCase
  FutureOr<Either<Failure, void>> call(Params params);
}

/// `UseCase` for getting data with Stream.
/// This usecase for getting data realtime.
///
/// Use case contains the app's business logic / rules, e.g. validations.
/// It should be independent from any other non-business logic-related
/// functionalities.
///
/// It can be connected with repository, although not every use case needs to
/// depend on the repository.
///
/// If you can live with less static typing, you can use `Params` type
/// as Params.
///
abstract class UseCaseStream<Failure, Type, Params> {
  /// Method to calling this useCase
  Stream<Either<Failure, Type>> call(Params params);
}

/// In cases where no params are to be passed, we call [NoParams]
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
