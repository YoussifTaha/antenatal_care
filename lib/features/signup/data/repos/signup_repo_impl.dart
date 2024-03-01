import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:antenatal_app/features/signup/data/repos/signup_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      FirebaseFailure failure = FirebaseFailure.fromFireBaseAuthError(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<void> createUser(
      {required String email,
      required String fullName,
      required String phone,
      required String uId,
      required String userType}) async {
    UserModel userModel = UserModel(
        fullName: fullName,
        email: email,
        phone: phone,
        uId: uId,
        userType: userType);
    FirebaseFirestore.instance
        .collection(userType)
        .doc(uId)
        .set(userModel.toJson());
  }
}
