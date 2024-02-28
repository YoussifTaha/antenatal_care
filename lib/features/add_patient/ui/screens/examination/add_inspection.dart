import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/abdomen_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/breast_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/face_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/lower_limbs_examination_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/neck_examination_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';

class AddInspectionAssessment extends StatefulWidget {
  final PageController pageController;
  const AddInspectionAssessment({
    super.key,
    required this.pageController,
  });

  @override
  State<AddInspectionAssessment> createState() =>
      _AddInspectionAssessmentState();
}

class _AddInspectionAssessmentState extends State<AddInspectionAssessment> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Inspection:',
                style: getSemiBoldStyle(color: Colors.black, fontSize: 20.sp),
              ),
              verticalSpace(30),
              FaceExaminationSection(),
              verticalSpace(20),
              myVerticalDivider(),
              verticalSpace(20),
              NeckExaminationSection(),
              verticalSpace(20),
              myVerticalDivider(),
              verticalSpace(20),
              AbdomenExaminationSection(),
              verticalSpace(20),
              myVerticalDivider(),
              verticalSpace(20),
              LowerLimbsExaminationSection(),
              verticalSpace(20),
              myVerticalDivider(),
              verticalSpace(20),
              BreastExaminationSection(),
              verticalSpace(30),
              button(
                context: context,
                function: () {
                  widget.pageController.nextPage(
                      duration: Duration(milliseconds: 800.toInt()),
                      curve: Curves.fastLinearToSlowEaseIn);
                  formKey.currentState!.save();
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
