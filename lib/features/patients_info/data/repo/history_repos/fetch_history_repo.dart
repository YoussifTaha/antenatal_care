import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/drug_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/past_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';
import 'package:dartz/dartz.dart';

abstract class FetchHistoryRepo {
  Future<Either<Failure, PersonalHistoryModel>> fetchPersonalHistory({
    required int patientId,
  });
  Future<Either<Failure, FamilyHistoryModel>> fetchFamilyHistory(
      {required int patientId});
  Future<Either<Failure, PastHistoryModel>> fetchPastHistory(
      {required int patientId});
  Future<Either<Failure, PresentHistoryModel>> fetchPresentHistory(
      {required int patientId});
  Future<Either<Failure, ObstetricHistoryModel>> fetchObstetricHistory(
      {required int patientId});
  Future<Either<Failure, DrugHistoryModel>> fetchDrugHistory(
      {required int patientId});
  Future<Either<Failure, MenstrualHistoryModel>> fetchMenstrualHistory(
      {required int patientId});
  Future<Either<Failure, UrineSystemHistoryModel>> fetchUrinarySystemHistory(
      {required int patientId});
  Future<Either<Failure, PsychologicalHistoryModel>> fetchPsychologicalHistory(
      {required int patientId});
}
