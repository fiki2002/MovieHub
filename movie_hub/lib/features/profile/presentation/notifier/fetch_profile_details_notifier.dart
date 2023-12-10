import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

class FetchProfileNotifier extends BaseNotifier<UserDetailsEntity> {
  final FetchProfileDetailsUsecase _fetchProfileUsecase;

  FetchProfileNotifier({
    required fetchProfileUsecase,
  }) : _fetchProfileUsecase = fetchProfileUsecase;

  void init() {
    fetchProfileDetails();
    super.onInit();
  }

  Future<void> fetchProfileDetails() async {
    setLoading();
    state = await _fetchProfileUsecase.execute();
    notifyListeners();
  }
}
