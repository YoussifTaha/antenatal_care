import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/home/data/repos/home_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  List<UserModel> patients = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();
  @override
  Future<Either<Failure, List<UserModel>>> fetchMyPatients(
      {required String uId}) async {
    patients = [];
    QuerySnapshot<Map<String, dynamic>> PatientsSnapshot =
        await myFirebaseFireStoreService.getMyPatientsCollection(uid: uId);
    try {
      for (var element in PatientsSnapshot.docs) {
        patients.add(UserModel.fromJson(element.data()));
      }
      return right(patients);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }
}
