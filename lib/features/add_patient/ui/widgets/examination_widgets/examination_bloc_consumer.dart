import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExaminationBlocConsumer extends StatelessWidget {
  final PageController pageController;
  final Widget button;
  const ExaminationBlocConsumer(
      {super.key, required this.button, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExaminationCubit, ExaminationState>(
      listener: (context, state) {
        if (state is AddPatientExaminationSuccsses) {
          pageController.nextPage(
              duration: Duration(milliseconds: 800.toInt()),
              curve: Curves.fastLinearToSlowEaseIn);
        }
        if (state is AddPatientExaminationError) {
          showToast(text: state.error, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is AddPatientExaminationLoadingState) {
          return CircularProgressIndicator();
        } else
          return button;
      },
    );
  }
}
