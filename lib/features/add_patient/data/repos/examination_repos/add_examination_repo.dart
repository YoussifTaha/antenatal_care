import 'package:antenatal_app/features/patients_info/data/models/examination_models/incontinence_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/inspection_model/inspection_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/palpation_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/vital_signs_model.dart';

abstract class AddExaminationRepo {
  void addInspectionExamination(
      {required int patientId, required InspectionModel inspectionModel});
  void addVitalSignsExamination(
      {required int patientId, required VitalSignsModel vitalSignsModel});
  void addIncontinenceExamination(
      {required int patientId, required IncontinenceModel incontinenceModel});
  void addPalpationExamination(
      {required int patientId, required PalpationModel palpationModel});
}
