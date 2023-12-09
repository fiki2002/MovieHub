import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class UpdateAvatarNotifier extends ChangeNotifier {
  final UpdateAvatarUsecase _updateUsecase;

  UpdateAvatarNotifier({
    required updateUsecase,
  }) : _updateUsecase = updateUsecase;

  Future<Either<Failure, BaseEntity>> updateAvatar(String avatar) async {
    try {
      _setUpdateAvatarState(UpdateAvatarState.isLoading);
      final response = await _updateUsecase.call(avatar);
      return response.fold(
        (l) {
          _handleFailure(l);
          return Left(l);
        },
        (r) {
          _handleSuccess(r);
          goBack();

          return Right(r);
        },
      );
    } finally {
      _setUpdateAvatarState(UpdateAvatarState.isDone);
    }
  }

  UpdateAvatarState _authState = UpdateAvatarState.isDone;

  UpdateAvatarState get authState => _authState;

  void _setUpdateAvatarState(UpdateAvatarState state) {
    _authState = state;
    notifyListeners();
  }

  void _handleFailure(Failure failure) {
    _setUpdateAvatarState(UpdateAvatarState.isError);

    SnackBarService.showErrorSnackBar(
      context: navigatorKey.currentContext!,
      message: failure.message,
    );
  }

  void _handleSuccess(BaseEntity res) {
    _setUpdateAvatarState(UpdateAvatarState.isDone);

    SnackBarService.showSuccessSnackBar(
      context: navigatorKey.currentContext!,
      message: res.message,
    );
  }
}

enum UpdateAvatarState { isLoading, isDone, isError }
