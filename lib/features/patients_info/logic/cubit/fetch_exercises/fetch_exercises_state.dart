part of 'fetch_exercises_cubit.dart';

sealed class FetchPatientExercisesState extends Equatable {
  const FetchPatientExercisesState();

  @override
  List<Object> get props => [];
}

final class FetchExercisesInitial extends FetchPatientExercisesState {}

final class FetchExercisesLoadingState extends FetchPatientExercisesState {}

final class FetchExercisesSuccsses extends FetchPatientExercisesState {
  final List<PatientsExercisesModel> exercises;

  FetchExercisesSuccsses({required this.exercises});
}

final class FetchExercisesError extends FetchPatientExercisesState {
  final String error;

  FetchExercisesError({required this.error});
}
