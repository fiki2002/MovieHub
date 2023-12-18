import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class WatchListDataSource {
  Future<BaseModel> addToWatchList(String movieId);
  Future<BaseModel> removeFromWatchList(String movieId);
  Future<List<String>> getWatchListIds();
}

class WatchListDataSourceImpl extends WatchListDataSource {
  final FirebaseHelper _firebaseHelper;

  WatchListDataSourceImpl({
    required FirebaseHelper firebaseHelper,
  }) : _firebaseHelper = firebaseHelper;

  @override
  Future<BaseModel> addToWatchList(String movieId) async {
    final String? userId = _firebaseHelper.currentUserId;

    await _firebaseHelper.watchListRef(userId: userId ?? '').doc(movieId).set(
      {
        'movie_id': movieId,
      },
    );

    return const BaseModel(
      message: 'Added to Watch list Successfully!',
      success: true,
    );
  }

  @override
  Future<BaseModel> removeFromWatchList(String movieId) async {
    final String? userId = _firebaseHelper.currentUserId;

    final DocumentSnapshot watchListDoc = await _firebaseHelper
        .watchListRef(userId: userId ?? '')
        .doc(movieId)
        .get();
    if (watchListDoc.exists) {
      await _firebaseHelper
          .watchListRef(userId: userId ?? '')
          .doc(movieId)
          .delete();

      return const BaseModel(
        message: 'Removed from Watch list Successfully!',
        success: true,
      );
    } else {
      return const BaseModel(
        message: 'Movie not found in Watch list',
        success: false,
      );
    }
  }

  @override
  Future<List<String>> getWatchListIds() async {
    final String? userId = _firebaseHelper.currentUserId;
    final QuerySnapshot<Map<String, dynamic>> watchListId =
        await _firebaseHelper.watchListRef(userId: userId ?? '').get(
              const GetOptions(source: Source.server),
            );
    final List<String> listOfId = watchListId.docs
        .map((watchList) => watchList['movie_id'] as String)
        .toList();
    return listOfId;
  }
}
