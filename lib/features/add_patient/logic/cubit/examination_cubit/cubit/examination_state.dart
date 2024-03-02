part of 'examination_cubit.dart';

sealed class ExaminationState extends Equatable {
  const ExaminationState();

  @override
  List<Object> get props => [];
}

final class ExaminationInitial extends ExaminationState {}

final class AddPatientExaminationLoadingState extends ExaminationState {}

final class AddPatientExaminationSuccsses extends ExaminationState {}

final class AddPatientExaminationError extends ExaminationState {
  final String error;

  AddPatientExaminationError({required this.error});
}
