import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_basic_info.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_examination_widgets/patient_examination.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/patient_main_history_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientsInfoScreen extends StatefulWidget {
  const PatientsInfoScreen({Key? key}) : super(key: key);

  @override
  State<PatientsInfoScreen> createState() => _PatientsInfoScreenState();
}

class _PatientsInfoScreenState extends State<PatientsInfoScreen> {
  PageController patientHistoryPageController = PageController();
  PageController patientExaminationPageController = PageController();

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
            PatientBsicInfo(),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 970,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      verticalSpace(10),
                      SizedBox(
                        height: 650,
                        child: PatientMainHistoryView(
                            pageController: patientHistoryPageController),
                      ),
                      Expanded(
                          child: PatientExamination(
                              pageController:
                                  patientExaminationPageController)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
