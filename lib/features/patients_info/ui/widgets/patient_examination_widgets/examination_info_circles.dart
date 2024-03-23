import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/examination_cubit/fetch_examination_cubit.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';

class ExaminationInfoCircles extends StatefulWidget {
  final int patientId;
  final PageController pageController;

  const ExaminationInfoCircles({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<ExaminationInfoCircles> createState() => _ExaminationInfoCirclesState();
}

class _ExaminationInfoCirclesState extends State<ExaminationInfoCircles> {
  @override
  Widget build(BuildContext context) {
    var cubit = PatientsInfoCubit.get(context);
    var fetchExaminationCubit = FetchExaminationCubit.get(context);
    return Column(
      children: [
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientExaminationScreenPageView(
                      newExaminationTitle: 'Inspection',
                      pageController: widget.pageController);
                  fetchExaminationCubit.fetchInspectionExamination(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Inspection',
                  info: '',
                  icon: Icons.remove_red_eye,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientExaminationScreenPageView(
                      newExaminationTitle: 'Vital Signs',
                      pageController: widget.pageController);
                  fetchExaminationCubit.fetchVitalSignsExamination(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Vital Signs',
                  info: '',
                  icon: Icons.favorite,
                ),
              ),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientExaminationScreenPageView(
                      newExaminationTitle: 'Incontinence Assessment',
                      pageController: widget.pageController);
                  fetchExaminationCubit.fetchIncontinenceExamination(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Incontinence Assessment',
                  info: '',
                  icon: Icons.water_drop_rounded,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  cubit.changePatientExaminationScreenPageView(
                      newExaminationTitle: 'Palpation',
                      pageController: widget.pageController);
                  fetchExaminationCubit.fetchPalpationExamination(
                      patientId: widget.patientId);
                },
                child: InfoCircles(
                  title: 'Palpation',
                  info: '',
                  icon: Icons.waving_hand_rounded,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
