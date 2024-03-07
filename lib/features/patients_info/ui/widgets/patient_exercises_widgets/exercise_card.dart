import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/patients_info/data/models/exercise_model/exercises_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExerciseCard extends StatelessWidget {
  final PatientsExercisesModel patientsExercisesModel;
  const ExerciseCard({super.key, required this.patientsExercisesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                                    imageUrl:
                                        '${patientsExercisesModel.thumbnail}'),
                              ),
                            )
                          ],
                        ),
                        horizontalSpace(10),
                        Column(
                          children: [
                            Text(
                              patientsExercisesModel.name ?? '',
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
            ],
          ),
          verticalSpace(10),
          button(
              color: ColorManger.darkPrimary,
              height: 40.h,
              context: context,
              function: () {
                context.pushNamed(Routes.fetchPatientExercisesDetailsScreen,
                    arguments: {
                      'patientsExercisesModel': patientsExercisesModel,
                    });
              },
              text: 'View Info'),
        ],
      ),
    );
  }
}
