part of 'patient_view_add_info_cubit.dart';

sealed class PatientViewAddInfoState extends Equatable {
  const PatientViewAddInfoState();

  @override
  List<Object> get props => [];
}

final class PatientViewAddInfoInitial extends PatientViewAddInfoState {}

final class AddPatientInfoFromPatientViewLoadingState
    extends PatientViewAddInfoState {}

final class AddPatientInfoFromPatientViewSuccsses
    extends PatientViewAddInfoState {}

final class AddPatientInfoFromPatientViewError extends PatientViewAddInfoState {
  final String error;

  AddPatientInfoFromPatientViewError({required this.error});
}
