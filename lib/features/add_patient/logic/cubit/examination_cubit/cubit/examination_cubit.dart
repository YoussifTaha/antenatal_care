import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/add_patient/data/repos/examination_repos/add_examination_repo.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/incontinence_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/inspection_model/inspection_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/palpation_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/vital_signs_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'examination_state.dart';

class ExaminationCubit extends Cubit<ExaminationState> {
  ExaminationCubit(this.addExaminationRepo) : super(ExaminationInitial());
  final AddExaminationRepo addExaminationRepo;

  static ExaminationCubit get(context) => BlocProvider.of(context);
  TextEditingController eyeLidsController = TextEditingController();
  TextEditingController lipsController = TextEditingController();
  TextEditingController cheeksController = TextEditingController();
  TextEditingController fascialExpressionController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController PreclampsiaController = TextEditingController();
  TextEditingController cloasmaController = TextEditingController();
  TextEditingController veinsController = TextEditingController();
  TextEditingController thyroidController = TextEditingController();
  TextEditingController stretchMarksController = TextEditingController();
  TextEditingController scarsController = TextEditingController();
  TextEditingController lineaNigraController = TextEditingController();
  TextEditingController deformityController = TextEditingController();
  TextEditingController varicoseVeinsController = TextEditingController();
  TextEditingController oedemaController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController skinTemperatureController = TextEditingController();
  TextEditingController primaryAreolaController = TextEditingController();
  TextEditingController secondaryAreolaController = TextEditingController();
  TextEditingController incontinenceGradeController = TextEditingController();
  TextEditingController incontinenceDescriptionController =
      TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();
  TextEditingController pulseRateController = TextEditingController();
  TextEditingController respiratoryRateController = TextEditingController();
  TextEditingController fundusLevelController = TextEditingController();
  TextEditingController rectusDiastasisController = TextEditingController();
  TextEditingController edemaTestController = TextEditingController();

  void addInspectionExamination({required int patientId}) {
    emit(AddPatientExaminationLoadingState());
    InspectionModel inspectionModel = fillInspectionModel();
    try {
      addExaminationRepo.addInspectionExamination(
          patientId: patientId, inspectionModel: inspectionModel);
      emit(AddPatientExaminationSuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(ExaminationInitial());
  }

  InspectionModel fillInspectionModel() {
    InspectionModel inspectionModel = InspectionModel(
      face: {
        'expression': fascialExpressionController.text,
        'color': colorController.text,
        'eyeLidsEdema': eyeLidsController.text,
        'lipsEdema': lipsController.text,
        'cheeksEdema': cheeksController.text,
      },
      abdomen: {
        'lineaNigra': lineaNigraController.text,
        'stretchMarks': stretchMarksController.text,
        'scar': scarsController.text,
      },
      breast: {
        'size': sizeController.text,
        'skinTemp': sizeController.text,
        'primaryAreola': primaryAreolaController.text,
        'secondryAreola': secondaryAreolaController.text,
      },
      lowerLimbs: {
        'deformity': deformityController.text,
        'varicoseVenis': varicoseVeinsController.text,
        'oedema': oedemaController.text,
      },
      neck: {
        'thyroid': thyroidController.text,
        'pulsatingVeins': veinsController.text,
      },
    );
    return inspectionModel;
  }

  void addIncontinenceExamination({required int patientId}) {
    emit(AddPatientExaminationLoadingState());
    IncontinenceModel incontinenceModel = IncontinenceModel(
        grade: incontinenceGradeController.text,
        description: incontinenceDescriptionController.text);
    try {
      addExaminationRepo.addIncontinenceExamination(
          patientId: patientId, incontinenceModel: incontinenceModel);
      emit(AddPatientExaminationSuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(ExaminationInitial());
  }

  void addPalpationExamination({required int patientId}) {
    emit(AddPatientExaminationLoadingState());
    PalpationModel palpationModel = PalpationModel(
        fundusLevel: fundusLevelController.text,
        rectusDiastasis: rectusDiastasisController.text,
        edemaTest: edemaTestController.text);
    try {
      addExaminationRepo.addPalpationExamination(
          patientId: patientId, palpationModel: palpationModel);
      emit(AddPatientExaminationSuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(ExaminationInitial());
  }

  void addVitalSignsExamination({required int patientId}) {
    emit(AddPatientExaminationLoadingState());
    VitalSignsModel vitalSignsModel = VitalSignsModel(
        bloodPressure: bloodPressureController.text,
        heartRate: heartRateController.text,
        pulseRate: pulseRateController.text,
        respiratoryRate: respiratoryRateController.text);
    try {
      addExaminationRepo.addVitalSignsExamination(
          patientId: patientId, vitalSignsModel: vitalSignsModel);
      emit(AddPatientExaminationSuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
    emit(ExaminationInitial());
  }

  void catchFireBaseException(FirebaseException e) {
    FirebaseFailure failure = FirebaseFailure.fromFirebaseFirestoreException(e);
    emit(AddPatientExaminationError(error: failure.message));
  }
}
