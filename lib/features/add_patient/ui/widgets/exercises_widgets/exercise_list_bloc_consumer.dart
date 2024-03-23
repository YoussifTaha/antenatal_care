import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/fetch_exercises_cubit/fetch_exercises_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/exercises_widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesListBlocConsumer extends StatelessWidget {
  const ExercisesListBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchExercisesCubit, FetchExercisesState>(
      builder: (context, state) {
        if (state is FetchExercisesLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is FetchExercisesSuccsses) {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ExerciseCard(exercisesModel: state.exercises[index]);
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
