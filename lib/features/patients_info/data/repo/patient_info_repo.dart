import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class PatientsInfoRepo {
  Future<Either<Failure, UserModel>> getBasicPatientInfo(
      {required String doctorUid, required int patientId});
}
