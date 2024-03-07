import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/add_patient/data/repos/history_repos/add_history_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/drug_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/past_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.addHistoryRepo) : super(HistoryInitial());
  final AddHistoryRepo addHistoryRepo;

  static HistoryCubit get(context) => BlocProvider.of(context);

  void addPersonalHistory(
      {required int patientId,
      required PersonalHistoryModel personalHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addPersonalHistory(
          patientId: patientId, personalHistoryModel: personalHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addDrugHistory(
      {required int patientId, required DrugHistoryModel drugHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addDrugHistory(
          patientId: patientId, drugHistoryModel: drugHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addFamilyHistory(
      {required int patientId,
      required FamilyHistoryModel familyHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addFamilyHistory(
          patientId: patientId, familyHistoryModel: familyHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addMenstrualHistory(
      {required int patientId,
      required MenstrualHistoryModel menstrualHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addMenstrualHistory(
          patientId: patientId, menstrualHistoryModel: menstrualHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addObstetricHistory(
      {required int patientId,
      required ObstetricHistoryModel obstetricHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addObstetricHistory(
          patientId: patientId, obstetricHistoryModel: obstetricHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addPastHistory(
      {required int patientId, required PastHistoryModel pastHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addPastHistory(
          patientId: patientId, pastHistoryModel: pastHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addPresentHistory(
      {required int patientId,
      required PresentHistoryModel presentHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addPresentHistory(
          patientId: patientId, presentHistoryModel: presentHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addPsychologicalHistory(
      {required int patientId,
      required PsychologicalHistoryModel psychologicalHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addPsychologicalHistory(
          patientId: patientId,
          psychologicalHistoryModel: psychologicalHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void addUrinarySystemHistory(
      {required int patientId,
      required UrineSystemHistoryModel urineSystemHistoryModel}) {
    emit(AddPatientHistoryLoadingState());
    try {
      addHistoryRepo.addUrinarySystemHistory(
          patientId: patientId,
          urineSystemHistoryModel: urineSystemHistoryModel);
      emit(AddPatientHistorySuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(HistoryInitial());
  }

  void catchFireBaseException(FirebaseException e) {
    FirebaseFailure failure = FirebaseFailure.fromFirebaseFirestoreException(e);
    emit(AddPatientHistoryError(error: failure.message));
  }
}
