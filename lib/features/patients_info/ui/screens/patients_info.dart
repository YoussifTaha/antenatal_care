import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_basic_info.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_info_choice.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientsInfoScreen extends StatefulWidget {
  final UserModel patient;
  const PatientsInfoScreen({Key? key, required this.patient}) : super(key: key);

  @override
  State<PatientsInfoScreen> createState() => _PatientsInfoScreenState();
}

class _PatientsInfoScreenState extends State<PatientsInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Patients Info',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            PatientBsicInfo(
              patient: widget.patient,
            ),
            verticalSpace(10),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.fetchPatientHistoryScreen, arguments: {
                  'patientId': widget.patient.patientId,
                });
              },
              child: PatientInfoChoice(
                  choice: 'Patient\'s History', icon: Icons.history),
            ),
            verticalSpace(20),
            InkWell(
              onTap: () {
                context.pushNamed(Routes.fetchPatientExaminationScreen,
                    arguments: {
                      'patientId': widget.patient.patientId,
                    });
              },
              child: PatientInfoChoice(
                  choice: 'Patient\'s Examination',
                  icon: Icons.run_circle_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
