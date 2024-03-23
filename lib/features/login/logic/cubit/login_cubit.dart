import 'package:antenatal_app/features/login/data/models/login_model.dart';
import 'package:antenatal_app/features/login/data/repos/login_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  final LoginRepo loginRepo;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    emit(LoginLoadingState());
    LoginModel loginModel = LoginModel(
        email: emailController.text, password: passwordController.text);
    var result = await loginRepo.login(loginModel: loginModel);
    result.fold((faliure) {
      emit(LoginErrorState(error: faliure.message));
    }, (userCredential) {
      emit(LoginSuccessState(userCredential: userCredential));
    });
  }
}
