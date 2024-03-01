import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:antenatal_app/core/errors/faliure.dart';

abstract class AddPatientRepo {
  Future<Either<Failure, UserModel>> fetchPatientUser(
      {required String regionName, required String injuryName});
}
