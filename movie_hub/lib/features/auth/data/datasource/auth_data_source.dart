import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_hub/cores/cores.dart';
import 'package:movie_hub/features/auth/auth.dart';

abstract interface class AuthDataSource {
  Future<AuthResultModel> login(String email, String password);

  Future<AuthResultModel> signUp(SignUpParamsModel signUpForm);

  Future<void> forgotPassword(String email);

  Future<void> logOut();
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
    _checkIfUsernameAlreadyExist(signUpForm.userName);

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

    await _saveUser(user);
    return const AuthResultModel(
      success: true,
      message: 'Account created successfully!',
    );
  }

  Future<void> _checkIfUsernameAlreadyExist(String username) async {
    final AggregateQuerySnapshot aggregateQuerySnapshot = await _firebaseHelper
        .userCollectionRef()
        .where("username", isEqualTo: username)
        .count()
        .get(source: AggregateSource.server);

    final int count = aggregateQuerySnapshot.count;

    if (count > 0) {
      throw const BaseFailures(message: "Username already exist!");
    }
  }

  Future<void> _saveUser(User user) async {
    _firebaseHelper.userCollectionRef().doc(user.uid).set({
      'email': user.email,
      'user_name': user.displayName,
      'avatar_url': user.photoURL,
    });
  }
}
