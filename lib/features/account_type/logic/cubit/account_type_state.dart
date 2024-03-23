part of 'account_type_cubit.dart';

sealed class AccountTypeState extends Equatable {
  const AccountTypeState();

  @override
  List<Object> get props => [];
}

final class AccountTypeInitial extends AccountTypeState {}

final class CreateUserLoadingState extends AccountTypeState {}

final class CreateUserSuccessState extends AccountTypeState {}

final class CreateUserErrorState extends AccountTypeState {
  final String error;

  CreateUserErrorState({required this.error});
}

final class DoctorUserAccountTypeState extends AccountTypeState {}

final class PatientUserAccountTypeState extends AccountTypeState {}
