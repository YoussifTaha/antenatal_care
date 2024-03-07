import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'examination_info_circles.dart';
import 'incontinence_page.dart';
import 'inspection_page.dart';
import 'vital_signs_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'palpation_page.dart';

class PatientExamination extends StatefulWidget {
  final int patientId;
  const PatientExamination({super.key, required this.patientId});

  @override
  State<PatientExamination> createState() => _PatientExaminationState();
}

class _PatientExaminationState extends State<PatientExamination> {
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Patient Examination',
                style: getMediumStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
            ),
            verticalSpace(10),
            myVerticalDivider(),
            BlocConsumer<PatientsInfoCubit, PatientsInfoState>(
              listener: (context, state) {},
              builder: (context, state) {
                String patientExaminationTitle =
                    PatientsInfoCubit.get(context).patientExaminationTitle;
                return Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return ExaminationInfoCircles(
                          patientId: widget.patientId,
                          pageController: pageController,
                        );
                      } else {
                        switch (patientExaminationTitle) {
                          case 'Inspection':
                            return InspectionScreen(
                              pageController: pageController,
                            );
                          case 'Vital Signs':
                            return VitalSignsPage(
                              pageController: pageController,
                            );
                          case 'Incontinence Assessment':
                            return IncontinencePage(
                              pageController: pageController,
                            );
                          default:
                            return PalpationScreen(
                              pageController: pageController,
                            );
                        }
                      }
                    },
                    itemCount: 2,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
