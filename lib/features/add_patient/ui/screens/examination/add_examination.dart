import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/examination/add_palpation_assessment.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/examination/add_vital_signs_and_incontinence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_inspection.dart';

class AddPatientExaminationScreen extends StatefulWidget {
  final int patientId;
  const AddPatientExaminationScreen({Key? key, required this.patientId})
      : super(key: key);

  @override
  State<AddPatientExaminationScreen> createState() =>
      _AddPatientExaminationScreenState();
}

class _AddPatientExaminationScreenState
    extends State<AddPatientExaminationScreen> {
  PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 1.1,
  );
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
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height.h,
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
          controller: pageController,
          itemBuilder: (context, index) {
            switch (index) {
              case 1:
                return AddVitalSignsAssessment(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
              case 2:
                return AddPalpationAssessment(
                  patientId: widget.patientId,
                  pageController: pageController,
                );

              default:
                return AddInspectionAssessment(
                  patientId: widget.patientId,
                  pageController: pageController,
                );
            }
          },
        ),
      ),
    );
  }
}
