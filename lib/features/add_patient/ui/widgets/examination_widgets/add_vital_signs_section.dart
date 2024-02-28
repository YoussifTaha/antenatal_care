import 'package:antenatal_app/core/Helpers/examination_input_controllers.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/vital_signs_question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddVitalSignsSection extends StatelessWidget {
  final PageController pageController;
  const AddVitalSignsSection({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    ExaminationInputControllers examinationInputControllers =
        ExaminationInputControllers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Vital Signs:',
                  style: getSemiBoldStyle(color: Colors.black, fontSize: 20.sp),
                ),
              ],
            ),
            BackIconButton(pageController: pageController),
          ],
        ),
        verticalSpace(10),
        VitalSignsQuestionItem(
            controller: examinationInputControllers.bloodPressureController,
            title: 'Blood Pressure:',
            icon: Icons.water_drop_rounded),
        verticalSpace(20),
        VitalSignsQuestionItem(
            controller: examinationInputControllers.heartRateController,
            title: 'Heart Rate:',
            icon: Icons.favorite_border_rounded),
        verticalSpace(20),
        VitalSignsQuestionItem(
            controller: examinationInputControllers.pulseRateController,
            title: 'Pulse rate:',
            icon: Icons.area_chart_rounded),
        verticalSpace(20),
        VitalSignsQuestionItem(
            controller: examinationInputControllers.respiratoryRateController,
            title: 'Respiratory Rate:',
            icon: Icons.timeline),
      ],
    );
  }
}
