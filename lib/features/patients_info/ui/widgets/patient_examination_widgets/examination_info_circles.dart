import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';

class ExaminationInfoCircles extends StatefulWidget {
  final PageController pageController;

  const ExaminationInfoCircles({
    super.key,
    required this.pageController,
  });

  @override
  State<ExaminationInfoCircles> createState() => _ExaminationInfoCirclesState();
}

class _ExaminationInfoCirclesState extends State<ExaminationInfoCircles> {
  @override
  Widget build(BuildContext context) {
    var cubit = PatientsInfoCubit.get(context);
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
