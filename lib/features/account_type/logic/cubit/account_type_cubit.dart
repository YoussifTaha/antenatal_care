import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/account_type/data/repos/account_type_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_type_state.dart';

class AccountTypeCubit extends Cubit<AccountTypeState> {
  AccountTypeCubit(this.accountTypeRepo) : super(AccountTypeInitial());

  static AccountTypeCubit get(context) => BlocProvider.of(context);
  String userType = 'userDoctor';
  final AccountTypeRepo accountTypeRepo;

  Future<void> userCreate(
      {required String email,
      required String fullName,
      required String phone}) async {
    emit(CreateUserLoadingState());
    String? uId = FirebaseAuth.instance.currentUser?.uid;
    try {
      print(uId);
      await accountTypeRepo.createUser(
          email: email,
          fullName: fullName,
          phone: phone,
          uId: uId ?? 'nouId',
          userType: userType);
      emit(CreateUserSuccessState());
    } on Failure catch (e) {
      emit(CreateUserErrorState(error: e.message));
    }
  }

  void makeDoctorUserType({required String accountType}) {
    emit(DoctorUserAccountTypeState());
    userType = accountType;
  }

  void makePatientUserType({required String accountType}) {
    emit(PatientUserAccountTypeState());
    userType = accountType;
  }
}
