import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercises_model/exercises_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExerciseRepo {
  Future<Either<Failure, List<ExercisesModel>>> fetchExercises();

  void addExercises(
      {required int patientId, required List<ExercisesModel> patientExercises});
}
