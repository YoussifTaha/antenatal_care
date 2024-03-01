import 'package:antenatal_app/features/signup/data/repos/signup_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signUpRepo) : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);

  final SignUpRepo signUpRepo;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    emit(SignupLoadingState());
    var result = await signUpRepo.signUp(
        email: emailController.text, password: passwordController.text);
    result.fold((faliure) {
      emit(SignupErrorState(error: faliure.message));
    }, (userCredential) {
      emit(SignupSuccessState(userCredential: userCredential));
    });
  }
}
