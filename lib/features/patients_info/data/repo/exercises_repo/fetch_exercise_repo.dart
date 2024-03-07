import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercise_model/exercises_model.dart';
import 'package:dartz/dartz.dart';

abstract class FetchPatientExerciseRepo {
  Future<Either<Failure, List<PatientsExercisesModel>>> fetchExercises(
      {required int patientId});
}
