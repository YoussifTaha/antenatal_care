part of 'patient_view_add_routines_cubit.dart';

sealed class PatientViewAddRoutinesState extends Equatable {
  const PatientViewAddRoutinesState();

  @override
  List<Object> get props => [];
}

final class PatientViewAddRoutinesInitial extends PatientViewAddRoutinesState {}

final class PatientViewAddRoutinesLoading extends PatientViewAddRoutinesState {}

final class PatientViewNewTimeAdded extends PatientViewAddRoutinesState {}

final class AddPatientRoutinesFromPatientViewError
    extends PatientViewAddRoutinesState {
  final String error;

  AddPatientRoutinesFromPatientViewError({required this.error});
}
