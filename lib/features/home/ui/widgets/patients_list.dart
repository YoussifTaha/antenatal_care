import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/home/logic/cubit/home_cubit.dart';
import 'package:antenatal_app/features/home/ui/widgets/patient_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientsList extends StatelessWidget {
  const PatientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is GetMyPatientsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetMyPatientsSuccsses) {
          if (state.patients.length != 0) {
            return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PatientCard(
                    patient: state.patients[index],
                  );
                },
                separatorBuilder: (context, index) => horizontalSpace(10),
                itemCount: state.patients.length);
          } else
            return Center(child: Text('No Patients Yet'));
        } else if (state is GetMyPatientsError) {
          return Text(state.error);
        } else
          return Text('Unkown Error');
      },
    );
  }
}
