import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class PatientsViewInfoRepo {
  Future<Either<Failure, UserModel>> getBasicPatientInfo();
}
