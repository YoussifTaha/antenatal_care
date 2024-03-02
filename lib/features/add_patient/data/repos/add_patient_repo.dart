import 'package:antenatal_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:antenatal_app/core/errors/faliure.dart';

abstract class AddPatientRepo {
  Future<Either<Failure, UserModel>> fetchPatientUser(
      {required int patientId, required UserInfoModel patientInfo});

  Future<QuerySnapshot<Object?>> getPatientDataById({required patientId});

  void saveDataInUserModel(
      {required QuerySnapshot<Object?> patientQuery,
      required UserInfoModel? patientInfo});

  void addPatientToMyPatientsCollection({
    required int patientId,
  });
}
