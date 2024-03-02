import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/add_patient/data/repos/examination_repos/add_examination_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/incontinence_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/inspection_model/inspection_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/palpation_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/vital_signs_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddExaminationRepoImpl extends AddExaminationRepo {
  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();

  CollectionReference<Object?> getExaminationCollection(int patientId) {
    CollectionReference examinationCollection = myFirebaseService
        .doctorCollection
        .doc('RLIXEvSewOX33ikNzf8baaksvu62')
        .collection('myPatients')
        .doc('$patientId')
        .collection('Examination');
    return examinationCollection;
  }

  @override
  void addIncontinenceExamination(
      {required int patientId, required IncontinenceModel incontinenceModel}) {
    CollectionReference<Object?> examinationCollection =
        getExaminationCollection(patientId);
    examinationCollection
        .doc('IncontinenceExamination')
        .set(incontinenceModel.toJson());
  }

  @override
  void addInspectionExamination(
      {required int patientId, required InspectionModel inspectionModel}) {
    CollectionReference<Object?> examinationCollection =
        getExaminationCollection(patientId);
    examinationCollection
        .doc('InspectionExamination')
        .set(inspectionModel.toJson());
  }

  @override
  void addPalpationExamination(
      {required int patientId, required PalpationModel palpationModel}) {
    CollectionReference<Object?> examinationCollection =
        getExaminationCollection(patientId);
    examinationCollection
        .doc('PalpationExamination')
        .set(palpationModel.toJson());
  }

  @override
  void addVitalSignsExamination(
      {required int patientId, required VitalSignsModel vitalSignsModel}) {
    CollectionReference<Object?> examinationCollection =
        getExaminationCollection(patientId);
    examinationCollection
        .doc('VitalSignsExamination')
        .set(vitalSignsModel.toJson());
  }
}
