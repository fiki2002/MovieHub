import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class AuthNotifier extends ChangeNotifier {
  final LoginUsecase _logInUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final SignUpUsecase _signUpUsecase;

  AuthNotifier({
    required logInUsecase,
    required forgotPasswordUsecase,
    required signUpUsecase,
  })  : _logInUsecase = logInUsecase,
        _forgotPasswordUsecase = forgotPasswordUsecase,
        _signUpUsecase = signUpUsecase;

  Map<String, String> _authData = {
    email: '',
    userName: '',
    password: '',
  };

  void resetAuthData() {
    _authData = {
      email: '',
      userName: '',
      password: '',
    };
    notifyListeners();
  }

  void updateAuthData(var key, var value) {
    if (_authData.containsKey(key)) {
      _authData.update(key, (_) => value);
    } else {
      _authData.putIfAbsent(key, () => value);
    }
    notifyListeners();
  }

  AuthState _authState = AuthState.isDone;

  AuthState get authState => _authState;

  void _setAuthState(AuthState state) {
    _authState = state;
    notifyListeners();
  }

  Future<Either<Failure, AuthResultEntity>> signUp() async {
    _setAuthState(AuthState.isLoading);
    try {
      final response = await _signUpUsecase.call(
        SignUpParamsModel(
          userName: _authData[userName] ?? '',
          password: _authData[password] ?? '',
          email: _authData[email] ?? '',
        ),
      );

      return response.fold(
        (Failure failure) {
          _handleFailure(failure);

          return Left(failure);
        },
        (AuthResultEntity res) {
          _handleSuccess(res);

          return Right(res);
        },
      );
    } finally {
      _finish();
    }
  }

  Future<Either<Failure, AuthResultEntity>> signIn() async {
    try {
      _setAuthState(AuthState.isLoading);

      final response = await _logInUsecase.call(
        LoginDataParams(
          email: _authData[email] ?? '',
          password: _authData[password] ?? '',
        ),
      );

      return response.fold(
        (Failure failure) {
          _handleFailure(failure);

          return Left(failure);
        },
        (AuthResultEntity res) {
          _handleSuccess(res);

          return Right(res);
        },
      );
    } finally {
      _finish();
    }
  }

  Future<Either<Failure, void>> forgotPassword() async {
    try {
      _setAuthState(AuthState.isLoading);

      final response =
          await _forgotPasswordUsecase.call(_authData[email] ?? '');

      return response.fold(
        (Failure failure) {
          _handleFailure(failure);

          return Left(failure);
        },
        (_) {
          _setAuthState(AuthState.isDone);
          return const Right(null);
        },
      );
    } finally {}
  }

  _handleFailure(Failure failure) {
    _setAuthState(AuthState.isError);

    SnackBarService.showErrorSnackBar(
      context: navigatorKey.currentContext!,
      message: failure.message,
    );
  }

  _handleSuccess(AuthResultEntity res) {
    _setAuthState(AuthState.isDone);

    resetAuthData();

    SnackBarService.showSuccessSnackBar(
      context: navigatorKey.currentContext!,
      message: res.message,
    );

    goReplace(NavBarView.route);
  }

  void _finish() {
    _setAuthState(AuthState.isDone);

    resetAuthData();
  }
}

enum AuthState { isLoading, isDone, isError }
