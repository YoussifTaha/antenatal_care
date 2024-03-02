import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBlocConsumer extends StatelessWidget {
  final PageController pageController;
  final Widget button;
  const HistoryBlocConsumer(
      {super.key, required this.button, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryCubit, HistoryState>(
      listener: (context, state) {
        if (state is AddPatientHistorySuccsses) {
          pageController.nextPage(
              duration: Duration(milliseconds: 800.toInt()),
              curve: Curves.fastLinearToSlowEaseIn);
        }
        if (state is AddPatientHistoryError) {
          showToast(text: state.error, state: ToastStates.error);
        }
      },
      builder: (context, state) {
        if (state is AddPatientHistoryLoadingState) {
          return CircularProgressIndicator();
        } else
          return button;
      },
    );
  }
}
