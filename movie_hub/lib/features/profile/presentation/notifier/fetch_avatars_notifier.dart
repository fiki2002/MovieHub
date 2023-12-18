import 'package:flutter/material.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchAvatarNotifier extends ChangeNotifier {
  final FetchAvatarsUsecase _fetchAvatarsUsecase;

  FetchAvatarNotifier({
    required fetchAvatarsUsecase,
  }) : _fetchAvatarsUsecase = fetchAvatarsUsecase;

  List<String>? _avatarList;
  List<String>? get listOfAvatar => _avatarList;

  Future<void> fetchAvatar() async {
    _setAvatarState(FetchAvatarState.isLoading);
    final res = await _fetchAvatarsUsecase.call(const NoParams());
    res.fold(
      (l) {},
      (r) {
        _avatarList = r;
        notifyListeners();
        _setAvatarState(FetchAvatarState.isDone);
      },
    );
  }

  FetchAvatarState _avatarState = FetchAvatarState.isDone;
  FetchAvatarState get avatarState => _avatarState;

  void _setAvatarState(FetchAvatarState state) {
    _avatarState = state;
    notifyListeners();
  }
}

enum FetchAvatarState { isLoading, isError, isDone }
