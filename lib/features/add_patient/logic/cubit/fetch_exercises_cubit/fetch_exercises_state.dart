part of 'fetch_exercises_cubit.dart';

sealed class FetchExercisesState extends Equatable {
  const FetchExercisesState();

  @override
  List<Object> get props => [];
}

final class ExercisesInitial extends FetchExercisesState {}

final class FetchExercisesLoadingState extends FetchExercisesState {}

final class FetchExercisesSuccsses extends FetchExercisesState {
  final List<ExercisesModel> exercises;

  FetchExercisesSuccsses({required this.exercises});
}

final class FetchExercisesError extends FetchExercisesState {
  final String error;

  FetchExercisesError({required this.error});
}

final class AddExerciseSuccsses extends FetchExercisesState {
  final ExercisesModel exercise;

  AddExerciseSuccsses({required this.exercise});
}

final class AddExerciseError extends FetchExercisesState {
  final String error;

  AddExerciseError({required this.error});
}
