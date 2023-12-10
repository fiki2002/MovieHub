import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class ProfileDataSource {
  Future<ServiceResponse<UserDetailsModel>> fetchProfileDetails();
  Future<ServiceResponse<List<String>>> getAvatars();
  Future<BaseModel> updateAvatarUrl(String avatarUrl);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final FirebaseHelper _firebaseHelper;
  final Reference _firebaseStorage = FirebaseStorage.instance.ref();

  ProfileDataSourceImpl({
    required FirebaseHelper firebaseHelper,
  }) : _firebaseHelper = firebaseHelper;

  @override
  Future<ServiceResponse<UserDetailsModel>> fetchProfileDetails() {
    return serveFuture<UserDetailsModel>(function: (fail) async {
      final String? userId = _firebaseHelper.currentUserId;

      final DocumentSnapshot<Map<String, dynamic>> result =
          await _firebaseHelper.userCollectionRef().doc(userId).get();

      return UserDetailsModel.fromMap(result.data()!);
    });
  }

  @override
  Future<ServiceResponse<List<String>>> getAvatars() async {
    return serveFuture(
      function: (fail) async {
        final List<String> imageUrlList = [];

        for (var index = 1; index < 7; index++) {
          final ref =
              _firebaseStorage.child('avatar').child('avatar_$index.jpg');
          final path = await ref.getDownloadURL();
          imageUrlList.add(path);
        }
        return imageUrlList;
      },
    );
  }

  @override
  Future<BaseModel> updateAvatarUrl(String avatarUrl) async {
    final String? userId = _firebaseHelper.currentUserId;

    await _firebaseHelper.userCollectionRef().doc(userId).set(
      {
        'avatar_url': avatarUrl,
      },
      SetOptions(merge: true),
    );

    return const BaseModel(
      success: true,
      message: "Avatar updated successfully!",
    );
  }
}
