part of 'loading_screen_cubit.dart';

sealed class LoadingScreenState extends Equatable {
  const LoadingScreenState();

  @override
  List<Object> get props => [];
}

final class LoadingScreenInitial extends LoadingScreenState {}

final class GetMyDoctorUidLoadingState extends LoadingScreenState {}

final class GetMyDoctorUidSuccsses extends LoadingScreenState {
  final String myDoctorUid;

  GetMyDoctorUidSuccsses({required this.myDoctorUid});
}

final class GetMyDoctorUidError extends LoadingScreenState {
  final String error;

  GetMyDoctorUidError({required this.error});
}

final class FetchPatientIdLoadingState extends LoadingScreenState {}

final class FetchPatientIdSuccssesState extends LoadingScreenState {
  final int? patientId;

  FetchPatientIdSuccssesState({required this.patientId});
}

final class FetchPatientIdErrorState extends LoadingScreenState {
  final String error;

  FetchPatientIdErrorState({required this.error});
}
