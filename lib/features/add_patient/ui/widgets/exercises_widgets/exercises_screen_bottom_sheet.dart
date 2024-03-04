import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/add_exercises_cubit/add_exercises_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExercisesScreenBottomSheet extends StatelessWidget {
  final int patientId;
  const ExercisesScreenBottomSheet({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddExercisesCubit, AddExercisesState>(
      builder: (context, state) {
        bool isEmptyExercised =
            AddExercisesCubit.get(context).isEmptyExercises();
        List exercises = AddExercisesCubit.get(context).patientExercises;
        if (!isEmptyExercised) {
          return SizedBox.shrink();
        } else
          return ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Container(
              width: double.infinity,
              height: 80.h,
              color: ColorManger.primary,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'Patient\'s Exercises List (${exercises.length} Exercises)',
                              style: getBoldStyle(
                                  textHeight: 1.2,
                                  color: Colors.white,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(10),
                      Column(
                        children: [
                          button(
                              fontSize: 11.sp,
                              color: Colors.white,
                              textColor: ColorManger.darkPrimary,
                              width: 130.w,
                              context: context,
                              function: () {
                                AddExercisesCubit.get(context)
                                    .addExercises(patientId: patientId);
                                showToast(
                                    text: 'Exercises Added Successfully',
                                    state: ToastStates.success);
                                Future.delayed(Duration(milliseconds: 300), () {
                                  context.pushNamed(
                                      Routes.historyOrExaminationScreen,
                                      arguments: {
                                        'patientId': patientId,
                                      });
                                });
                              },
                              text: 'Add Exercises'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
