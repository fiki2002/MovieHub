import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

abstract interface class AuthDataSource {
  Future<AuthResultModel> login(String email, String password);

  Future<AuthResultModel> signUp(SignUpParamsModel signUpForm);

  Future<void> forgotPassword(String email);

  Future<void> logOut();

  Future<bool> isLoggedIn();
}

class AuthDataSourceImpl extends AuthDataSource {
  final FirebaseHelper _firebaseHelper;

  AuthDataSourceImpl({
    required FirebaseHelper firebaseHelper,
  }) : _firebaseHelper = firebaseHelper;

  @override
  Future<void> forgotPassword(String email) async {
    return await _firebaseHelper.auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> logOut() async {
    return await _firebaseHelper.auth.signOut();
  }

  @override
  Future<AuthResultModel> login(String email, String password) async {
    final UserCredential userCredential = await _firebaseHelper.auth
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user == null) {
      throw const BaseFailures(
        message: "Unable to login user with this credential",
      );
    }
    return const AuthResultModel(
      success: true,
      message: 'Login successful!',
    );
  }

  @override
  Future<AuthResultModel> signUp(SignUpParamsModel signUpForm) async {
    await _checkIfUsernameAlreadyExist(signUpForm.userName);

    final UserCredential userCredential =
        await _firebaseHelper.auth.createUserWithEmailAndPassword(
      email: signUpForm.email,
      password: signUpForm.password,
    );

    if (userCredential.user == null) {
      throw const BaseFailures(
        message: "Unable to create account with this credential",
      );
    }

    final User user = userCredential.user!;

    await _saveUser(user, signUpForm);
    return const AuthResultModel(
      success: true,
      message: 'Account created successfully!',
    );
  }

  Future<void> _checkIfUsernameAlreadyExist(String username) async {
    final AggregateQuerySnapshot aggregateQuerySnapshot = await _firebaseHelper
        .userCollectionRef()
        .where("user_name", isEqualTo: username)
        .count()
        .get(source: AggregateSource.server);

    final int? count = aggregateQuerySnapshot.count;

    if ((count ?? 0) > 0) {
      throw const BaseFailures(message: "Username already exist!");
    }
  }

  Future<void> _saveUser(User user, SignUpParamsModel params) async {
    _firebaseHelper.userCollectionRef().doc(user.uid).set({
      'user_id': user.uid,
      'email': user.email,
      'user_name': params.userName,
      'avatar_url': null,
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return _firebaseHelper.currentUserId != null ||
        _firebaseHelper.currentUserId == '';
  }
}
