part of 'fetch_examination_cubit.dart';

sealed class FetchExaminationState extends Equatable {
  const FetchExaminationState();

  @override
  List<Object> get props => [];
}

final class FetchExaminationInitial extends FetchExaminationState {}

final class FetchExaminationLoading extends FetchExaminationState {}

final class FetchInspectionSuccsses extends FetchExaminationState {
  final InspectionModel inspectionModel;

  FetchInspectionSuccsses({required this.inspectionModel});
}

final class FetchIncontinenceSuccsses extends FetchExaminationState {
  final IncontinenceModel incontinenceModel;

  FetchIncontinenceSuccsses({required this.incontinenceModel});
}

final class FetchVitalSignsSuccsses extends FetchExaminationState {
  final VitalSignsModel vitalSignsModel;

  FetchVitalSignsSuccsses({required this.vitalSignsModel});
}

final class FetchPalpationSuccsses extends FetchExaminationState {
  final PalpationModel palpationModel;

  FetchPalpationSuccsses({required this.palpationModel});
}

final class FetchExaminationError extends FetchExaminationState {
  final String error;

  FetchExaminationError({required this.error});
}
