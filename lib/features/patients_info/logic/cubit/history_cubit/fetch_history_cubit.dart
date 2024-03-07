import 'package:antenatal_app/features/patients_info/data/models/history_models/drug_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/past_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/repo/history_repos/fetch_history_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_history_state.dart';

class FetchHistoryCubit extends Cubit<FetchHistoryState> {
  FetchHistoryCubit(this.fetchHistoryRepo) : super(FetchHistoryInitial());

  final FetchHistoryRepo fetchHistoryRepo;

  static FetchHistoryCubit get(context) => BlocProvider.of(context);

  Future<void> fetchDrugHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result = await fetchHistoryRepo.fetchDrugHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (drugHistoryModel) {
      emit(FetchDrugHistorySuccsses(drugHistoryModel: drugHistoryModel));
    });
  }

  Future<void> fetchFamilyHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchFamilyHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (familyHistoryModel) {
      emit(FetchFamilyHistorySuccsses(familyHistoryModel: familyHistoryModel));
    });
  }

  Future<void> fetchMenstrualHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchMenstrualHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (menstrualHistoryModel) {
      emit(FetchMenstrualHistorySuccsses(
          menstrualHistoryModel: menstrualHistoryModel));
    });
  }

  Future<void> fetchObstetricHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchObstetricHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (obstetricHistoryModel) {
      emit(FetchObstetricHistorySuccsses(
          obstetricHistoryModel: obstetricHistoryModel));
    });
  }

  Future<void> fetchPastHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result = await fetchHistoryRepo.fetchPastHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (pastHistoryModel) {
      emit(FetchPastHistorySuccsses(pastHistoryModel: pastHistoryModel));
    });
  }

  Future<void> fetchPersonalHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchPersonalHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (personalHistoryModel) {
      emit(FetchPersonalHistorySuccsses(
          personalHistoryModel: personalHistoryModel));
    });
  }

  Future<void> fetchPresentHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchPresentHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (presentHistoryModel) {
      emit(FetchPresentHistorySuccsses(
          presentHistoryModel: presentHistoryModel));
    });
  }

  Future<void> fetchPsychologicalHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchPsychologicalHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (psychologicalHistoryModel) {
      emit(FetchPsychologicalHistorySuccsses(
          psychologicalHistoryModel: psychologicalHistoryModel));
    });
  }

  Future<void> fetchUrinarySystemHistory({required int patientId}) async {
    emit(FetchHistoryLoading());
    var result =
        await fetchHistoryRepo.fetchUrinarySystemHistory(patientId: patientId);
    result.fold((faliure) {
      emit(FetchHistoryError(error: faliure.message));
    }, (urineSystemHistoryModel) {
      emit(FetchUrinarySystemHistorySuccsses(
          urineSystemHistoryModel: urineSystemHistoryModel));
    });
  }
}
