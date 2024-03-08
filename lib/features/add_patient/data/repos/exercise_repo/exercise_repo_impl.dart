import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/add_patient/data/repos/exercise_repo/exercise_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercises_model/exercises_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

class ExerciseRepoImpl extends ExerciseRepo {
  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();
  List<ExercisesModel> exercises = [];

  @override
  Future<Either<Failure, List<ExercisesModel>>> fetchExercises() async {
    exercises = [];
    QuerySnapshot<Map<String, dynamic>> exerciseSnapshot =
        await myFirebaseService.getExercisesCollection();
    try {
      for (var element in exerciseSnapshot.docs) {
        exercises.add(ExercisesModel.fromJson(element.data()));
      }
      return right(exercises);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(failure);
    }
  }

  CollectionReference<Object?> getExercisesCollection(int patientId) {
    CollectionReference exercisesCollection = myFirebaseService.doctorCollection
        .doc('${CacheHelper.getData(key: 'uId')}')
        .collection('myPatients')
        .doc('$patientId')
        .collection('Exercises');
    return exercisesCollection;
  }

  @override
  void addExercises(
      {required int patientId,
      required List<ExercisesModel> patientExercises}) {
    CollectionReference<Object?> exercisesCollection =
        getExercisesCollection(patientId);
    patientExercises.forEach((exercise) {
      exercisesCollection.doc(exercise.name).set(exercise.toJson());
    });
  }
}
