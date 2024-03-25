import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/patient_view/logic/cubit/patient_view_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_info_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatWithDoctorSection extends StatelessWidget {
  const ChatWithDoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientViewCubit, PatientViewState>(
      builder: (context, state) {
        if (state is GetPatientBasicInfoSuccsses) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                context.pushNamed(Routes.chatDetails, arguments: {
                  'patient': state.patient,
                });
              },
              child: PatientInfoChoice(
                  choice: 'Chat With Doctor', icon: Icons.chat),
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
