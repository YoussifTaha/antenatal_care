part of 'fetch_exercises_cubit.dart';

sealed class FetchExercisesState extends Equatable {
  const FetchExercisesState();

  @override
  List<Object> get props => [];
}

final class FetchExercisesInitial extends FetchExercisesState {}

final class FetchExercisesLoadingState extends FetchExercisesState {}

final class FetchExercisesSuccsses extends FetchExercisesState {
  final List<PatientsExercisesModel> exercises;

  FetchExercisesSuccsses({required this.exercises});
}

final class FetchExercisesError extends FetchExercisesState {
  final String error;

  FetchExercisesError({required this.error});
}
