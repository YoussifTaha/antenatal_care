import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/post_login/data/repo/post_login_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class PostLoginRepoImpl extends PostLoginRepo {
  String userType = '';
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, String>> fetchUserType({required String uId}) async {
    DocumentSnapshot<Object?> docSnapshot =
        await getDocsInDoctorsCollection(uId: uId);
    bool isDoctor = docSnapshot.exists;

    DocumentSnapshot doctorDoc = await myFirebaseFireStoreService.getDoctorDoc(
        uid: CacheHelper.getData(key: 'uId'));

    DocumentSnapshot patientDoc =
        await myFirebaseFireStoreService.getPatientDoc(uid: uId);

    try {
      checkTheUserTypeThenCacheIt(isDoctor, doctorDoc, patientDoc);
      return right(userType);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getDocsInDoctorsCollection(
      {required String uId}) async {
    DocumentSnapshot docSnapshot =
        await myFirebaseFireStoreService.doctorCollection.doc(uId).get();
    return docSnapshot;
  }

  void checkTheUserTypeThenCacheIt(
      bool isDoctor,
      DocumentSnapshot<Object?> doctorDoc,
      DocumentSnapshot<Object?> patientDoc) {
    if (isDoctor == true) {
      userType = doctorDoc.get('userType');
      cacheUserTyper();
    } else
      userType = patientDoc.get('userType');
    cacheUserTyper();
  }

  void cacheUserTyper() {
    CacheHelper.saveData(
      key: 'userType',
      value: userType,
    );
  }
}
