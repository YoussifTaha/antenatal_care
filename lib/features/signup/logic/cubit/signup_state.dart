part of 'signup_cubit.dart';

sealed class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final UserCredential userCredential;

  SignupSuccessState({required this.userCredential});
}

final class SignupErrorState extends SignupState {
  final String error;

  SignupErrorState({required this.error});
}
