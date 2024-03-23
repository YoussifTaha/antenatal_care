import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/fetch_exercises_cubit/fetch_exercises_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/exercises_widgets/exercise_list_bloc_consumer.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/exercises_widgets/exercises_screen_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExercisesScreen extends StatefulWidget {
  final int patientId;
  const ExercisesScreen({super.key, required this.patientId});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  void initState() {
    super.initState();
    FetchExercisesCubit.get(context).fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Patient',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
      ),
      bottomSheet: ExercisesScreenBottomSheet(
        patientId: widget.patientId,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Patient\'s Exercises',
                style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
              ),
              verticalSpace(20),
              ExercisesListBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }
}
