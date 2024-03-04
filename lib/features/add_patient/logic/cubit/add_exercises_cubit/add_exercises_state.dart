part of 'add_exercises_cubit.dart';

sealed class AddExercisesState extends Equatable {
  const AddExercisesState();

  @override
  List<Object> get props => [];
}

final class AddExercisesInitial extends AddExercisesState {}

final class AddExerciseSuccsses extends AddExercisesState {
  final ExercisesModel exercise;

  AddExerciseSuccsses({required this.exercise});
}

final class removeExerciseSuccsses extends AddExercisesState {
  final ExercisesModel exercise;

  removeExerciseSuccsses({required this.exercise});
}

final class AddExerciseError extends AddExercisesState {
  final String error;

  AddExerciseError({required this.error});
}
