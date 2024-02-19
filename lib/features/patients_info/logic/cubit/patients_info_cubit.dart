import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'patients_info_state.dart';

class PatientsInfoCubit extends Cubit<PatientsInfoState> {
  PatientsInfoCubit() : super(PatientsInfoInitial());

  static PatientsInfoCubit get(context) => BlocProvider.of(context);

  String patientHistoryTitle = 'personalHistory';
  String patientExaminationTitle = 'Inspection';

  void changePatientHistoryScreenPageView(
      {required String newHistoryTitle,
      required PageController pageController}) {
    changePatientHistoryTitle(newHistoryTitle: newHistoryTitle);
    animateToPage(pageController);
    emit(PatientsInfoNewScreenState());
  }

  void changePatientExaminationScreenPageView(
      {required String newExaminationTitle,
      required PageController pageController}) {
    changePatientExaminationTitle(newExaminationTitle: newExaminationTitle);
    print(newExaminationTitle);
    animateToPage(pageController);
    emit(PatientsInfoNewScreenState());
  }

  void animateToPage(PageController pageController) {
    pageController.animateToPage(1,
        duration: Duration(milliseconds: 800.toInt()),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void changePatientHistoryTitle({required String newHistoryTitle}) {
    patientHistoryTitle = newHistoryTitle;
  }

  void changePatientExaminationTitle({required String newExaminationTitle}) {
    patientExaminationTitle = newExaminationTitle;
  }
}
