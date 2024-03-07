import 'package:antenatal_app/features/patients_info/data/models/examination_models/incontinence_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/inspection_model/inspection_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/palpation_model.dart';
import 'package:antenatal_app/features/patients_info/data/models/examination_models/vital_signs_model.dart';
import 'package:antenatal_app/features/patients_info/data/repo/examination_repos/fetch_examination_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_examination_state.dart';

class FetchExaminationCubit extends Cubit<FetchExaminationState> {
  FetchExaminationCubit(this.fetchExaminationRepo)
      : super(FetchExaminationInitial());
  final FetchExaminationRepo fetchExaminationRepo;

  static FetchExaminationCubit get(context) => BlocProvider.of(context);

  String edemaDescription({required String grade}) {
    switch (grade) {
      case '1':
        return 'Mild pitting  (2mm)';
      case '2':
        return 'Moderate pitting  (4mm), disappears after 5:10 sec';
      case '3':
        return 'Moderate sever (6mm), disappears after more than 1 min';
      case '4':
        return 'Sever pitting (8mm), disappears after more than 2 min';
      default:
        return 'Non-pitting';
    }
  }

  String incontinenceDescription({required String grade}) {
    switch (grade) {
      case '2':
        return 'Contraction held for 1-3 seconds or fingers not elevated';
      case '3':
        return 'Contraction held for 4-6 seconds and fingers elevated, repeated 3 times';
      case '4':
        return 'Contraction held for 7-9 seconds and fingers elevated, repeated 3 times';
      case '5':
        return 'Rapid contraction with elevation of fingers for 7-9 seconds, repeated 4 times';
      default:
        return 'Contraction held less than 1 second';
    }
  }

  Future<void> fetchInspectionExamination({required int patientId}) async {
    emit(FetchExaminationLoading());
    var result = await fetchExaminationRepo.fetchInspectionExamination(
        patientId: patientId);
    result.fold((faliure) {
      emit(FetchExaminationError(error: faliure.message));
    }, (inspectionModel) {
      emit(FetchInspectionSuccsses(inspectionModel: inspectionModel));
    });
  }

  Future<void> fetchVitalSignsExamination({required int patientId}) async {
    emit(FetchExaminationLoading());
    var result = await fetchExaminationRepo.fetchVitalSignsExamination(
        patientId: patientId);
    result.fold((faliure) {
      emit(FetchExaminationError(error: faliure.message));
    }, (vitalSignsModel) {
      emit(FetchVitalSignsSuccsses(vitalSignsModel: vitalSignsModel));
    });
  }

  Future<void> fetchIncontinenceExamination({required int patientId}) async {
    emit(FetchExaminationLoading());
    var result = await fetchExaminationRepo.fetchIncontinenceExamination(
        patientId: patientId);
    result.fold((faliure) {
      emit(FetchExaminationError(error: faliure.message));
    }, (incontinenceModel) {
      emit(FetchIncontinenceSuccsses(incontinenceModel: incontinenceModel));
    });
  }

  Future<void> fetchPalpationExamination({required int patientId}) async {
    emit(FetchExaminationLoading());
    var result = await fetchExaminationRepo.fetchPalpationExamination(
        patientId: patientId);
    result.fold((faliure) {
      emit(FetchExaminationError(error: faliure.message));
    }, (palpationModel) {
      emit(FetchPalpationSuccsses(palpationModel: palpationModel));
    });
  }
}
