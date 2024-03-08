import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patient_view_loading-screen/data/repo/loading_screen_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class LoadingScreenRepoImpl extends LoadingScreenRepo {
  String myDoctorUid = '';
  bool? isPersonalInfoAdded;
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, String>> fetchMyDoctorUid(
      {required String uId}) async {
    DocumentSnapshot patientDoc =
        await myFirebaseFireStoreService.getPatientDoc(uid: uId);
    try {
      myDoctorUid = patientDoc.get('myDoctorUid');
      CacheHelper.saveData(
        key: 'myDoctorUid',
        value: myDoctorUid,
      );
      return right(myDoctorUid);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, bool>> fetchIsPersonalInfoAdded(
      {required String uId}) async {
    DocumentSnapshot patientDoc =
        await myFirebaseFireStoreService.getPatientDoc(uid: uId);
    try {
      isPersonalInfoAdded = patientDoc.get('isPersonalInfoAdded');
      if (isPersonalInfoAdded == null) {
        isPersonalInfoAdded = false;
      }
      CacheHelper.saveData(
        key: 'isPersonalInfoAdded',
        value: isPersonalInfoAdded,
      );
      return right(isPersonalInfoAdded!);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }
}