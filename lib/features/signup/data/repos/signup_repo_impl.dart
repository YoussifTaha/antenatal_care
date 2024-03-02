import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/signup/data/repos/signup_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepoImpl extends SignUpRepo {
  @override
  Future<Either<Failure, UserCredential>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CashHelper.saveData(key: 'uId', value: userCredential.user!.uid);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      FirebaseFailure failure = FirebaseFailure.fromFireBaseAuthError(e);
      return left(
        failure,
      );
    }
  }
}
