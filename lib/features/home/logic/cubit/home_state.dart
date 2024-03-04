part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class GetMyPatientsLoadingState extends HomeState {}

final class GetMyPatientsSuccsses extends HomeState {
  final List<UserModel> patients;

  GetMyPatientsSuccsses({required this.patients});
}

final class GetMyPatientsError extends HomeState {
  final String error;

  GetMyPatientsError({required this.error});
}

final class GetDoctorNameLoadingState extends HomeState {}

final class GetDoctorNameSuccsses extends HomeState {
  final String doctorName;

  GetDoctorNameSuccsses({required this.doctorName});
}

final class GetDoctorNameError extends HomeState {
  final String error;

  GetDoctorNameError({required this.error});
}
