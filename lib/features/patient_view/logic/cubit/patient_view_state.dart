part of 'patient_view_cubit.dart';

sealed class PatientViewState extends Equatable {
  const PatientViewState();

  @override
  List<Object> get props => [];
}

final class PatientViewInitial extends PatientViewState {}

final class GetPatientBasicInfoLoadingState extends PatientViewState {}

final class GetPatientBasicInfoSuccsses extends PatientViewState {
  final UserModel patient;

  GetPatientBasicInfoSuccsses({required this.patient});
}

final class GetPatientBasicInfoError extends PatientViewState {
  final String error;

  GetPatientBasicInfoError({required this.error});
}
