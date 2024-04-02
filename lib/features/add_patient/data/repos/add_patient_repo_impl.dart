import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/add_patient/data/models/add_user_info_model.dart';
import 'package:antenatal_app/features/add_patient/data/repos/add_patient_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class AddPatientRepoImpl extends AddPatientRepo {
  UserModel? patient;

  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();
  @override
  Future<Either<Failure, UserModel>> fetchPatientUser(
      {required int patientId, required UserInfoModel patientInfo}) async {
    QuerySnapshot<Object?> patientQuery =
        await getPatientDataById(patientId: patientId);

    try {
      saveDataInUserModel(patientQuery: patientQuery, patientInfo: patientInfo);
      addPatientToMyPatientsCollection(patientId: patientId);
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
  Future<QuerySnapshot<Object?>> getPatientDataById(
      {required patientId}) async {
    QuerySnapshot patientQuery = await myFirebaseService.patientCollection
        .where('patientId', isEqualTo: patientId)
        .get();
    String patientDocID = patientQuery.docs.first.id;
    await addDoctorUidToPatientDoc(patientDocID);
    return patientQuery;
  }

  Future<void> addDoctorUidToPatientDoc(String patientDocID) async {
    await myFirebaseService.patientCollection
        .doc(patientDocID)
        .update({'myDoctorUid': CacheHelper.getData(key: 'uId')});
  }

  @override
  void saveDataInUserModel(
      {required QuerySnapshot<Object?> patientQuery,
      required UserInfoModel? patientInfo}) {
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
        chiefComplain: patientInfo?.chiefComplain,
        eDD: patientInfo?.eDD,
        weekNumber: patientInfo?.weekNumber);
  }

  @override
  void addPatientToMyPatientsCollection({
    required int patientId,
  }) {
    CollectionReference myPatientsCollection = myFirebaseService
        .doctorCollection
        .doc('${CacheHelper.getData(key: 'uId')}')
        .collection('myPatients');
    myPatientsCollection.doc('$patientId').set(patient?.toJson());
  }
}