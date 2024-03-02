import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patients_info/data/repo/patient_info_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class PatientsInfoRepoImpl extends PatientsInfoRepo {
  UserModel? patient;

  @override
  Future<Either<Failure, UserModel>> getBasicPatientInfo(
      {required String doctorUid, required int patientId}) async {
    QuerySnapshot<Object?> patientQuery =
        await getPatientDataById(patientId: patientId);

    try {
      Map<String, dynamic> patientData =
          patientQuery.docs.first.data() as Map<String, dynamic>;

      patient = UserModel(
          patientId: patientData['patientId'],
          fullName: patientData['fullName'],
          email: patientData['email'],
          phone: patientData['phone'],
          uId: patientData['uId'],
          userType: patientData['userType'],
          age: patientData['age'] ?? '',
          occupation: patientData['occupation'] ?? '',
          chiefComplain: patientData['chiefComplain'],
          eDD: patientData['eDD'],
          weekNumber: patientData['weekNumber']);

      return right(patient!);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  Future<QuerySnapshot<Object?>> getPatientDataById(
      {required patientId}) async {
    var myFirebaseService;
    QuerySnapshot patientQuery = await myFirebaseService.patientCollection
        .where('patientId', isEqualTo: patientId)
        .get();
    return patientQuery;
  }
}
