import 'package:antenatal_app/features/patients_info/data/models/exercise_model/exercises_model.dart';
import 'package:antenatal_app/features/patients_info/data/repo/exercises_repo/fetch_exercise_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_patient_exercises_state.dart';

class FetchPatientExercisesCubit extends Cubit<FetchPatientExercisesState> {
  FetchPatientExercisesCubit(this.fetchPatientExerciseRepo)
      : super(FetchExercisesInitial());

  final FetchPatientExerciseRepo fetchPatientExerciseRepo;
  static FetchPatientExercisesCubit get(context) => BlocProvider.of(context);

  List<PatientsExercisesModel> patientExercises = [];

  Future<void> fetchExercises({required int patientId}) async {
    emit(FetchExercisesLoadingState());
    var result =
        await fetchPatientExerciseRepo.fetchExercises(patientId: patientId);
    result.fold((faliure) {
      emit(FetchExercisesError(error: faliure.message));
    }, (exercises) {
      emit(FetchExercisesSuccsses(exercises: exercises));
    });
  }
}
