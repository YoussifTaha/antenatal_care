import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/account_type/data/repos/account_type_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'account_type_state.dart';

class AccountTypeCubit extends Cubit<AccountTypeState> {
  AccountTypeCubit(this.accountTypeRepo) : super(AccountTypeInitial());

  static AccountTypeCubit get(context) => BlocProvider.of(context);
  String userType = 'userDoctor';
  final AccountTypeRepo accountTypeRepo;
  int patientId = 0;

  Future<void> userCreate(
      {required String email,
      required String fullName,
      required String phone}) async {
    emit(CreateUserLoadingState());
    String? uId = FirebaseAuth.instance.currentUser?.uid;
    try {
      await getPatientId();
      await addPatientToDataBase(email, fullName, phone, uId);
      emit(CreateUserSuccessState());
    } on Failure catch (e) {
      emit(CreateUserErrorState(error: e.message));
    }
  }

  Future<void> addPatientToDataBase(
      String email, String fullName, String phone, String? uId) async {
    await accountTypeRepo.createUser(
        email: email,
        fullName: fullName,
        phone: phone,
        uId: uId ?? 'noUID',
        userType: userType,
        patientId: patientId);
  }

  Future<void> getPatientId() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('userPatient').get();
    int patientsCount = querySnapshot.docs.length;
    patientId = patientsCount + 1;
  }

  void makeDoctorUserType({required String accountType}) {
    emit(DoctorUserAccountTypeState());
    userType = accountType;
  }

  void makePatientUserType({required String accountType}) {
    emit(PatientUserAccountTypeState());
    userType = accountType;
  }

  void navigateBasedOnUserType({required BuildContext context}) {
    if (userType == 'userDoctor') {
      context.pushNamedAndRemoveUntill(Routes.homeLayout,
          predicate: (Route<dynamic> route) => false);
    } else {
      context.pushNamedAndRemoveUntill(Routes.patientIdScreen,
          predicate: (Route<dynamic> route) => false);
    }
  }
}
