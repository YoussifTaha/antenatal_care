import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/incontinence_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/inspection_model/inspection_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/palpation_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/vital_signs_model.dart';
import 'package:dartz/dartz.dart';

abstract class FetchExaminationRepo {
  Future<Either<Failure, InspectionModel>> fetchInspectionExamination(
      {required int patientId});
  Future<Either<Failure, VitalSignsModel>> fetchVitalSignsExamination(
      {required int patientId});
  Future<Either<Failure, IncontinenceModel>> fetchIncontinenceExamination(
      {required int patientId});
  Future<Either<Failure, PalpationModel>> fetchPalpationExamination(
      {required int patientId});
}
