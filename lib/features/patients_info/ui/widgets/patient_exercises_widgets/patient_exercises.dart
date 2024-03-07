import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/fetch_exercises/fetch_exercises_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_exercises_widgets/exercise_list_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientExercises extends StatefulWidget {
  final int patientId;
  const PatientExercises({super.key, required this.patientId});

  @override
  State<PatientExercises> createState() => _PatientExercisesState();
}

class _PatientExercisesState extends State<PatientExercises> {
  @override
  void initState() {
    super.initState();
    FetchPatientExercisesCubit.get(context)
        .fetchExercises(patientId: widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Patient\'s Exercises',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
              verticalSpace(20),
              ExercisesListBlocConsumer()
            ],
          ),
        ),
      ),
    );
  }
}
