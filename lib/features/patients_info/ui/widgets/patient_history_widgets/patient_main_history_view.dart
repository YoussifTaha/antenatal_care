import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/drug_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/family_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/history_info_circles.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/menstrual_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/obstetric_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/past_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/personal_history_page.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/present_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/psychological_history.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/patient_history_widgets/urinary_system_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientMainHistoryView extends StatefulWidget {
  final patientId;
  const PatientMainHistoryView({super.key, this.patientId});

  @override
  State<PatientMainHistoryView> createState() => _PatientMainHistoryViewState();
}

class _PatientMainHistoryViewState extends State<PatientMainHistoryView> {
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
                'Patient History',
                style: getMediumStyle(
                    color: ColorManger.darkPrimary, fontSize: 18.sp),
              ),
            ),
            verticalSpace(10),
            myVerticalDivider(),
            BlocConsumer<PatientsInfoCubit, PatientsInfoState>(
              listener: (context, state) {},
              builder: (context, state) {
                String patientHistoryTitle =
                    PatientsInfoCubit.get(context).patientHistoryTitle;
                return Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return HistoryInfoCircles(
                          patientId: widget.patientId,
                          pageController: pageController,
                        );
                      } else {
                        switch (patientHistoryTitle) {
                          case 'Personal History':
                            return PersonalHistoryPage(
                              pageController: pageController,
                            );
                          case 'Family history':
                            return FamilyHistoryPage(
                              pageController: pageController,
                            );
                          case 'Present history':
                            return PresentHistoryPage(
                              pageController: pageController,
                            );
                          case 'Past history':
                            return PastHistoryPage(
                              pageController: pageController,
                            );
                          case 'Obstetric history':
                            return ObstetricHistoryPage(
                              pageController: pageController,
                            );
                          case 'Menstrual history':
                            return MenstrualHistoryPage(
                              pageController: pageController,
                            );
                          case 'History for urinary System':
                            return UrineSystemHistoryPage(
                              pageController: pageController,
                            );
                          case 'Drug History':
                            return DrugHistoryPage(
                              pageController: pageController,
                            );
                          default:
                            return PsychologicalHistoryPage(
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
