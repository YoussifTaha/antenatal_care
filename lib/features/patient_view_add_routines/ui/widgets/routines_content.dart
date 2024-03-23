import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/patient_view_add_routines/logic/cubit/patient_view_add_routines_cubit.dart';
import 'package:antenatal_app/features/patient_view_add_routines/ui/widgets/routines_question_and_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutinesContent extends StatelessWidget {
  const RoutinesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientViewAddRoutinesCubit,
        PatientViewAddRoutinesState>(
      builder: (context, state) {
        var cubit = PatientViewAddRoutinesCubit.get(context);
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManger.lightBackground,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RoutinesQuestionAndButton(
                question:
                    'When do you stand the most, whether at work or in the kitchen?',
                time: cubit.standingTime,
                setTime: () {
                  cubit.selectStandingTime(context);
                },
              ),
              RoutinesQuestionAndButton(
                question:
                    'When do you sit the most, whether at work or at home?',
                time: cubit.sittingTime,
                setTime: () {
                  cubit.selectSittingTime(context);
                },
              ),
              RoutinesQuestionAndButton(
                question: 'When do you do your house work?',
                time: cubit.houseWorkTime,
                setTime: () {
                  cubit.selectHouseWorkTime(context);
                },
              ),
              RoutinesQuestionAndButton(
                question: 'if you have a car, when do you drive?',
                time: cubit.drivingTime,
                setTime: () {
                  cubit.selectDrivingTime(context);
                },
              ),
              RoutinesQuestionAndButton(
                question: 'when do you do your exercises?',
                time: cubit.exercisesTime,
                setTime: () {
                  cubit.selectExercisesTime(context);
                },
              ),
              RoutinesQuestionAndButton(
                question: 'when do you go to bed?',
                time: cubit.bedTime,
                setTime: () {
                  cubit.selectBedTime(context);
                },
              ),
              button(
                  context: context,
                  function: () {
                    cubit.addPatientRoutines();
                  },
                  text: 'Save my Routines'),
              verticalSpace(10),
            ],
          ),
        );
      },
    );
  }
}
