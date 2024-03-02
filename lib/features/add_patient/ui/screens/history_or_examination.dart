import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/assessment_type_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryOrExamination extends StatelessWidget {
  final int patientId;
  const HistoryOrExamination({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.lessLightGray,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Patient',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Start The Assessment',
              style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
            ),
            verticalSpace(30),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.addPatientHistoryScreen, arguments: {
                  'patientId': patientId,
                });
              },
              child: AssessmentTypeChoice(
                  choice: 'Add Patient History', icon: Icons.history),
            ),
            verticalSpace(20),
            InkWell(
              onTap: () {
                context
                    .pushNamed(Routes.addPatientExaminationScreen, arguments: {
                  'patientId': patientId,
                });
              },
              child: AssessmentTypeChoice(
                  choice: 'Add Patient Examination',
                  icon: Icons.local_hospital_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
