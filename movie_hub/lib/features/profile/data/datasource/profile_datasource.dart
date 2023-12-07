import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/profile/profile.dart';

abstract class ProfileDataSource {
  Future<ServiceResponse<UserDetailsModel>> fetchProfileDetails();
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final FirebaseHelper _firebaseHelper;

  ProfileDataSourceImpl({required FirebaseHelper firebaseHelper})
      : _firebaseHelper = firebaseHelper;

  @override
  Future<ServiceResponse<UserDetailsModel>> fetchProfileDetails() {
    return serveFuture<UserDetailsModel>(function: (fail)async{
       final String? userId = _firebaseHelper.currentUserId;

      final DocumentSnapshot<Map<String, dynamic>> result =
          await _firebaseHelper.userCollectionRef().doc(userId).get();

      return UserDetailsModel.fromMap(result.data()!);
    });
  }
}
