import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserCredential>> signUp({
    required String email,
    required String password,
  });

  Future<void> createUser({
    required String email,
    required String fullName,
    required String phone,
    required String uId,
    required String userType,
  });
}
