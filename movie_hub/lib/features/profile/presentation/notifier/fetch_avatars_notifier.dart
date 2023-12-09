import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchAvatarNotifier extends BaseNotifier<List<String>> {
  final FetchAvatarsUsecase _fetchAvatarsUsecase;

  FetchAvatarNotifier({
    required fetchAvatarsUsecase,
  }) : _fetchAvatarsUsecase = fetchAvatarsUsecase;

  @override
  void onInit() {
    if (state.isLoading) {
      return;
    }
    fetchProfileDetails();
    super.onInit();
  }

  Future<void> fetchProfileDetails() async {
    setLoading();
    state = await _fetchAvatarsUsecase.execute();
    notifyListeners();
  }
}
