import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class LoadingScreenRepo {
  Future<Either<Failure, String>> fetchMyDoctorUid({required String uId});
  Future<Either<Failure, bool>> fetchIsPersonalInfoAdded({required String uId});
  Future<Either<Failure, int>> fetchMyId({required String uId});
}
