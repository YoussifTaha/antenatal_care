part of 'add_patient_cubit.dart';

sealed class AddPatientState extends Equatable {
  const AddPatientState();

  @override
  List<Object> get props => [];
}

final class AddPatientInitial extends AddPatientState {}

final class AddPatientLoadingState extends AddPatientState {}

final class AddPatientSuccsses extends AddPatientState {
  final UserModel patient;

  AddPatientSuccsses({required this.patient});
}

final class AddPatientError extends AddPatientState {
  final String error;

  AddPatientError({required this.error});
}
