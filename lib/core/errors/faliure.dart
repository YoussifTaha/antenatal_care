import 'package:firebase_auth/firebase_auth.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class FirebaseFailure extends Failure {
  FirebaseFailure(super.message);

  factory FirebaseFailure.fromFireBaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return FirebaseFailure('Email Is Invalid');
      case 'wrong-password':
        return FirebaseFailure('Password Is Wrong');
      case 'user-disabled':
        return FirebaseFailure('This User Is Disabled');
      case 'user-not-found':
        return FirebaseFailure(
            'There Is No User Found With This Email, Try Signing Up');
      case 'too-many-requests':
        return FirebaseFailure('Too Many Requests, Please Try Again Later');
      case 'network-request-failed':
        return FirebaseFailure('No Internet Connection');
      case 'email-already-in-use':
        return FirebaseFailure(
            'The email address is already in use by another account');
      default:
        return FirebaseFailure('An Error Occurred, Please Try Again Later');
    }
  }

  factory FirebaseFailure.fromFirebaseFirestoreException(FirebaseException e) {
    if (e.code == 'permission-denied') {
      return FirebaseFailure(
          'You Do Not Have The Permission To Acsses This Files');
    } else if (e.code == 'not-found') {
      return FirebaseFailure(
          'The Object You Are Trying To Acsses Is Not Found');
    }
    return FirebaseFailure('An Error Occurred, Please Try Again Later');
  }
}
