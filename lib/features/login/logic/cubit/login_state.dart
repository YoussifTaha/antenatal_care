part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final UserCredential userCredential;

  LoginSuccessState({required this.userCredential});
}

final class LoginErrorState extends LoginState {
  final String error;

  LoginErrorState({required this.error});
}
