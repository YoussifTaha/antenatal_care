import 'package:antenatal_app/features/add_patient/data/repos/exercise_repo/exercise_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercises_model/exercises_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_exercises_state.dart';

class FetchExercisesCubit extends Cubit<FetchExercisesState> {
  FetchExercisesCubit(this.exerciseRepo) : super(ExercisesInitial());
  final ExerciseRepo exerciseRepo;
  static FetchExercisesCubit get(context) => BlocProvider.of(context);

  List<ExercisesModel> patientExercises = [];

  Future<void> fetchExercises() async {
    emit(FetchExercisesLoadingState());
    var result = await exerciseRepo.fetchExercises();
    result.fold((faliure) {
      emit(FetchExercisesError(error: faliure.message));
    }, (exercises) {
      emit(FetchExercisesSuccsses(exercises: exercises));
    });
  }
}
