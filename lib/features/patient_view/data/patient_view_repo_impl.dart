import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patient_view/data/patient_view_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class PatientsViewInfoRepoImpl extends PatientsViewInfoRepo {
  UserModel? patient;
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();
  String patientName = '';

  String? myDoctorUid = CacheHelper.getData(key: 'myDoctorUid');
  int? patientId = CacheHelper.getData(key: 'patientId');
  @override
  Future<Either<Failure, UserModel>> getBasicPatientInfo() async {
    DocumentSnapshot patientDoc = await myFirebaseFireStoreService
        .myPatientsCollection(uId: myDoctorUid ?? '')
        .doc('$patientId')
        .get();
    try {
      Map<String, dynamic> patientData =
          patientDoc.data() as Map<String, dynamic>;

      patient = UserModel(
          firstSessionDate: patientData['firstSessionDate'],
          address: patientData['address'],
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

  @override
  Future<Either<Failure, String>> fetchPatientName(
      {required String uId}) async {
    DocumentSnapshot patientDoc =
        await myFirebaseFireStoreService.patientCollection.doc(uId).get();
    try {
      patientName = patientDoc.get('fullName');
      CacheHelper.saveData(
        key: 'patientName',
        value: patientName,
      );
      return right(patientName);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }
}
