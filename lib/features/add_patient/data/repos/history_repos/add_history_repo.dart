import 'package:antenatal_app/features/patients_info/data/models/history_models/drug_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/family_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/past_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';

abstract class AddHistoryRepo {
  void addPersonalHistory(
      {required int patientId,
      required PersonalHistoryModel personalHistoryModel});
  void addFamilyHistory(
      {required int patientId, required FamilyHistoryModel familyHistoryModel});
  void addPastHistory(
      {required int patientId, required PastHistoryModel pastHistoryModel});
  void addPresentHistory(
      {required int patientId,
      required PresentHistoryModel presentHistoryModel});
  void addObstetricHistory(
      {required int patientId,
      required ObstetricHistoryModel obstetricHistoryModel});
  void addDrugHistory(
      {required int patientId, required DrugHistoryModel drugHistoryModel});
  void addMenstrualHistory(
      {required int patientId,
      required MenstrualHistoryModel menstrualHistoryModel});
  void addUrinarySystemHistory(
      {required int patientId,
      required UrineSystemHistoryModel urineSystemHistoryModel});
  void addPsychologicalHistory(
      {required int patientId,
      required PsychologicalHistoryModel psychologicalHistoryModel});
}
