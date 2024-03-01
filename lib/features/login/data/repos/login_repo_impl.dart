import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/login/data/models/login_model.dart';
import 'package:antenatal_app/features/login/data/repos/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImpl extends LoginRepo {
  @override
  Future<Either<Failure, UserCredential>> login({
    required LoginModel loginModel,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      FirebaseFailure failure = FirebaseFailure.fromFireBaseAuthError(e);
      return left(
        failure,
      );
    }
  }
}
