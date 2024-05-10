import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/patient_view_add_info/data/repo/patient_view_add_info_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patient_view_add_info_state.dart';

class PatientViewAddInfoCubit extends Cubit<PatientViewAddInfoState> {
  PatientViewAddInfoCubit(this.patientViewAddInfoRepo)
      : super(PatientViewAddInfoInitial());

  static PatientViewAddInfoCubit get(context) => BlocProvider.of(context);

  final PatientViewAddInfoRepo patientViewAddInfoRepo;

  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController occupationController = TextEditingController();

  void addPatientInfoFromPatientView() {
    emit(AddPatientInfoFromPatientViewLoadingState());
    try {
      patientViewAddInfoRepo.addPatientInfoFromPatientView(patientInfo: {
        'age': ageController.text,
        'address': addressController.text,
        'occupation': occupationController.text,
        'isPersonalInfoAdded': true,
      });
      emit(AddPatientInfoFromPatientViewSuccsses());
    } on FirebaseException catch (e) {
      catchFireBaseException(e);
    }
  }

  void catchFireBaseException(FirebaseException e) {
    FirebaseFailure failure = FirebaseFailure.fromFirebaseFirestoreException(e);
    emit(AddPatientInfoFromPatientViewError(error: failure.message));
  }
}
