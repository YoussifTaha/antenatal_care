import 'package:antenatal_app/features/add_patient/data/repos/exercise_repo/exercise_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercises_model/exercises_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_exercises_state.dart';

class AddExercisesCubit extends Cubit<AddExercisesState> {
  AddExercisesCubit(this.exerciseRepo) : super(AddExercisesInitial());
  final ExerciseRepo exerciseRepo;
  static AddExercisesCubit get(context) => BlocProvider.of(context);

  List<ExercisesModel> patientExercises = [];
  bool isEmptyExercises() {
    if (patientExercises.isNotEmpty) {
      return true;
    } else
      return false;
  }

  void addExercises({required int patientId}) {
    exerciseRepo.addExercises(
        patientId: patientId, patientExercises: patientExercises);
  }

  bool isExerciseInList(ExercisesModel exerciseModel) {
    return patientExercises.contains(exerciseModel);
  }

  void addOrRemoveExercise({required ExercisesModel exercisesModel}) {
    if (isExerciseInList(exercisesModel)) {
      removeSingleExerciseToExercisesList(exercisesModel: exercisesModel);
    } else
      addSingleExerciseToExercisesList(exercisesModel: exercisesModel);
  }

  void addSingleExerciseToExercisesList(
      {required ExercisesModel exercisesModel}) {
    patientExercises.add(exercisesModel);
    (patientExercises.length);
    emit(AddExerciseSuccsses(exercise: exercisesModel));
    emit(AddExercisesInitial());
  }

  void removeSingleExerciseToExercisesList(
      {required ExercisesModel exercisesModel}) {
    patientExercises.remove(exercisesModel);
    emit(AddExerciseSuccsses(exercise: exercisesModel));
    emit(AddExercisesInitial());
  }
}
