import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercise_model/exercises_model.dart';
import 'package:antenatal_app/features/patients_info/data/repo/exercises_repo/fetch_exercise_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

class FetchPatientExerciseRepoImpl extends FetchPatientExerciseRepo {
  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();
  List<PatientsExercisesModel> exercises = [];

  @override
  Future<Either<Failure, List<PatientsExercisesModel>>> fetchExercises(
      {required int patientId}) async {
    exercises = [];
    QuerySnapshot<Map<String, dynamic>> exerciseSnapshot =
        await getExercisesCollection(patientId: patientId);
    try {
      for (var element in exerciseSnapshot.docs) {
        exercises.add(PatientsExercisesModel.fromJson(element.data()));
      }
      print(exercises.length);
      return right(exercises);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(failure);
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getExercisesCollection(
      {required int patientId}) async {
    return await myFirebaseService.doctorCollection
        .doc(doctorDocUid())
        .collection('myPatients')
        .doc('$patientId')
        .collection('Exercises')
        .get();
  }

  String doctorDocUid() {
    if (CacheHelper.getData(key: 'userType') == 'userDoctor') {
      return CacheHelper.getData(key: 'uId');
    } else
      return CacheHelper.getData(key: 'myDoctorUid');
  }
}
