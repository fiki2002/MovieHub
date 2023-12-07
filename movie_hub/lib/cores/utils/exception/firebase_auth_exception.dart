import 'base_exception.dart';

class AuthFirebaseException extends BaseFailures {
  const AuthFirebaseException(this.errorCode, [this.stackTrack])
      : super(message: "");

  final String errorCode;
  final StackTrace? stackTrack;

  @override
  String get message => _getMessage();

  String _getMessage() {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";

      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";

      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";

      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";

      case "ERROR_TOO_MANY_REQUESTS":
      case "too-many-request":
        return "Too many requests to log into this account.";

      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";

      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";

      case "weak-password":
        return "Password should be at least 6 characters.";

      default:
        return "An Undefined Auth Error happened.";
    }
  }
}
