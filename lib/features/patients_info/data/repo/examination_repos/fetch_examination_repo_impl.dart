import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/incontinence_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/inspection_model/inspection_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/palpation_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/vital_signs_model.dart';
import 'package:antenatal_app/features/patients_info/data/repo/examination_repos/fetch_examination_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FetchExaminationRepoImpl extends FetchExaminationRepo {
  MyFirebaseFireStoreService myFirebaseService = MyFirebaseFireStoreService();

  CollectionReference<Object?> getExaminationCollection(int patientId) {
    CollectionReference examinationCollection = myFirebaseService
        .doctorCollection
        .doc('${CacheHelper.getData(key: 'uId')}')
        .collection('myPatients')
        .doc('$patientId')
        .collection('Examination');
    return examinationCollection;
  }

  @override
  Future<Either<Failure, IncontinenceModel>> fetchIncontinenceExamination(
      {required int patientId}) async {
    DocumentSnapshot incontinenceDoc = await getExaminationCollection(patientId)
        .doc('IncontinenceExamination')
        .get();
    try {
      IncontinenceModel incontinenceModel =
          IncontinenceModel(grade: incontinenceDoc.get('grade'));
      return right(incontinenceModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, InspectionModel>> fetchInspectionExamination(
      {required int patientId}) async {
    DocumentSnapshot inspectionDoc = await getExaminationCollection(patientId)
        .doc('InspectionExamination')
        .get();
    try {
      InspectionModel inspectionModel = InspectionModel(
        face: inspectionDoc.get('face'),
        neck: inspectionDoc.get('neck'),
        abdomen: inspectionDoc.get('abdomen'),
        lowerLimbs: inspectionDoc.get('lowerLimbs'),
        breast: inspectionDoc.get('breast'),
      );
      return right(inspectionModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, PalpationModel>> fetchPalpationExamination(
      {required int patientId}) async {
    DocumentSnapshot palpationDoc = await getExaminationCollection(patientId)
        .doc('PalpationExamination')
        .get();
    try {
      PalpationModel palpationModel = PalpationModel(
          fundusLevel: palpationDoc.get('fundusLevel'),
          rectusDiastasis: palpationDoc.get('rectusDiastasis'),
          edemaTest: palpationDoc.get('edemaTest'));
      return right(palpationModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  Future<Either<Failure, VitalSignsModel>> fetchVitalSignsExamination({
    required int patientId,
  }) async {
    DocumentSnapshot vitalSignsDoc = await getExaminationCollection(patientId)
        .doc('VitalSignsExamination')
        .get();
    try {
      VitalSignsModel vitalSignsModel = VitalSignsModel(
          bloodPressure: vitalSignsDoc.get('bloodPressure'),
          heartRate: vitalSignsDoc.get('heartRate'),
          pulseRate: vitalSignsDoc.get('pulseRate'),
          respiratoryRate: vitalSignsDoc.get('respiratoryRate'));

      return right(vitalSignsModel);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }
}
