import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';
import 'package:movie_hub/features/movies/movie_dashboard.dart';

class AuthNotifier extends ChangeNotifier {
  final LoginUsecase _logInUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final SignUpUsecase _signUpUsecase;
  final CheckUserLoginStatusUsecase _checkUserStatusUsecase;
  final LogOutUsecase _logOutUsecase;

  AuthNotifier({
    required logInUsecase,
    required forgotPasswordUsecase,
    required signUpUsecase,
    required checkUserStatusUsecase,
    required logOutUsecase,
  })  : _logInUsecase = logInUsecase,
        _forgotPasswordUsecase = forgotPasswordUsecase,
        _signUpUsecase = signUpUsecase,
        _logOutUsecase = logOutUsecase,
        _checkUserStatusUsecase = checkUserStatusUsecase;

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

          clearRoad(NavBarView.route);

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

          clearRoad(NavBarView.route);

          navigatorKey.currentContext!.trendingMovies
              .getTrendingMoviesForTheDay();

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

          SnackBarService.showSuccessSnackBar(
            context: navigatorKey.currentContext!,
            message: 'Forgot Password Link Sent Successfully, '
                'Please Check Your Email',
          );

          goBack();

          return const Right(null);
        },
      );
    } finally {
      _finish();
    }
  }

  Future<Either<Failure, void>> logOut() async {
    try {
      _setAuthState(AuthState.isLoading);
      final response = await _logOutUsecase.call(const NoParams());
      return response.fold(
        (Failure failure) {
          _handleFailure(failure);

          return Left(failure);
        },
        (_) {
          _setAuthState(AuthState.isDone);

          SnackBarService.showSuccessSnackBar(
            context: navigatorKey.currentContext!,
            message: 'You\'ve been logged out successfully!',
          );

          navigatorKey.currentContext!.getWatchListNotifier.allMovieIds.clear();
          navigatorKey.currentContext!.watchList.allWatchList
              ?.clear();

          notifyListeners();

          clearRoad(SignInView.route);
          return const Right(null);
        },
      );
    } finally {
      _finish();
    }
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  /// Check User Login Status
  Future<bool> checkLoginStatus() async {
    final res = await _checkUserStatusUsecase.call(const NoParams());
    res.fold(
      (l) => Left(l),
      (r) {
        _isLoggedIn = true;
        notifyListeners();
      },
    );
    return _isLoggedIn;
  }

  void _handleFailure(Failure failure) {
    _setAuthState(AuthState.isError);

    SnackBarService.showErrorSnackBar(
      context: navigatorKey.currentContext!,
      message: failure.message,
    );
  }

  void _handleSuccess(AuthResultEntity res) {
    _setAuthState(AuthState.isDone);

    resetAuthData();

    SnackBarService.showSuccessSnackBar(
      context: navigatorKey.currentContext!,
      message: res.message,
    );
  }

  void _finish() {
    _setAuthState(AuthState.isDone);

    resetAuthData();
  }
}

enum AuthState { isLoading, isDone, isError }
