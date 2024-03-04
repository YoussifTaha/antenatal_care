import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/add_exercises_cubit/add_exercises_cubit.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercises_model/exercises_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCard extends StatelessWidget {
  final ExercisesModel exercisesModel;
  const ExerciseCard({super.key, required this.exercisesModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddExercisesCubit.get(context)
            .addOrRemoveExercise(exercisesModel: exercisesModel);
      },
      child: Container(
        width: double.infinity,
        height: 140.h,
        decoration: BoxDecoration(
          color: ColorManger.lessLightGray,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  width: 100.w,
                                  height: 60.h,
                                  child: CachedNetworkImage(
                                      imageUrl: '${exercisesModel.thumbnail}'),
                                ),
                              )
                            ],
                          ),
                          horizontalSpace(10),
                          Column(
                            children: [
                              Text(
                                exercisesModel.name ?? '',
                                style: getBoldStyle(
                                    color: Colors.black, fontSize: 12.sp),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    BlocBuilder<AddExercisesCubit, AddExercisesState>(
                      builder: (context, state) {
                        bool isExerciseInList = AddExercisesCubit.get(context)
                            .isExerciseInList(exercisesModel);
                        if (isExerciseInList) {
                          return Icon(
                            Icons.check_box_rounded,
                            color: ColorManger.primary,
                          );
                        } else
                          return Icon(
                            Icons.check_box_outline_blank_rounded,
                            color: ColorManger.primary,
                          );
                      },
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(10),
            button(
                color: ColorManger.darkPrimary,
                height: 40.h,
                context: context,
                function: () {
                  context.pushNamed(Routes.addPatientExercisesScreenDetails,
                      arguments: {
                        'exerciseModel': exercisesModel,
                      });
                },
                text: 'View Info'),
          ],
        ),
      ),
    );
  }
}
