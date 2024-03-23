part of 'patients_info_cubit.dart';

@immutable
sealed class PatientsInfoState {}

final class PatientsInfoInitial extends PatientsInfoState {}

final class PatientsInfoNewScreenState extends PatientsInfoState {}
