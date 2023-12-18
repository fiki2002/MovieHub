import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchProfileNotifier extends ChangeNotifier {
  final FetchProfileDetailsUsecase _fetchProfileUsecase;

  FetchProfileNotifier({
    required fetchProfileUsecase,
  }) : _fetchProfileUsecase = fetchProfileUsecase;

  UserDetailsModel? _userModel;
  UserDetailsModel? get userModel => _userModel;

  Future<void> fetchProfileDetails() async {
    _setProfileState(FetchProfileState.isLoading);
    final res = await _fetchProfileUsecase.call(const NoParams());
    res.fold(
      (l) {
        _setProfileState(FetchProfileState.isError);
      },
      (r) {
        _userModel = r;
        notifyListeners();
        _setProfileState(FetchProfileState.isDone);
      },
    );
  }

  FetchProfileState _profileState = FetchProfileState.isDone;
  FetchProfileState get profileState => _profileState;

  void _setProfileState(FetchProfileState state) {
    _profileState = state;
    notifyListeners();
  }
}

enum FetchProfileState { isLoading, isError, isDone }
