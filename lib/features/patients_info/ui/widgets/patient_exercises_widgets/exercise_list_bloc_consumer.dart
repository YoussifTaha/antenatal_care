import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/fetch_exercises/fetch_exercises_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_exercises_widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesListBlocConsumer extends StatelessWidget {
  const ExercisesListBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchPatientExercisesCubit, FetchPatientExercisesState>(
      builder: (context, state) {
        if (state is FetchExercisesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchExercisesSuccsses) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ExerciseCard(
                  patientsExercisesModel: state.exercises[index]);
            },
            separatorBuilder: (context, index) => verticalSpace(20),
            itemCount: state.exercises.length,
          );
        } else if (state is FetchExercisesError) {
          return Text(state.error);
        } else {
          return Text('UnKnown Error');
        }
      },
    );
  }
}
