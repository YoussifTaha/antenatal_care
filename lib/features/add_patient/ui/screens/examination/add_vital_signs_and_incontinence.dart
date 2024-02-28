import 'package:antenatal_app/core/Helpers/examination_input_controllers.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/add_incontinence_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/add_vital_signs_section.dart';
import 'package:flutter/material.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';

class AddVitalSignsAssessment extends StatefulWidget {
  final PageController pageController;
  const AddVitalSignsAssessment({
    super.key,
    required this.pageController,
  });

  @override
  State<AddVitalSignsAssessment> createState() =>
      _AddVitalSignsAssessmentState();
}

class _AddVitalSignsAssessmentState extends State<AddVitalSignsAssessment> {
  final formKey = GlobalKey<FormState>();
  ExaminationInputControllers examinationInputControllers =
      ExaminationInputControllers();

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
              AddVitalSignsSection(pageController: widget.pageController),
              verticalSpace(20),
              myVerticalDivider(),
              verticalSpace(20),
              AddIcontinenceSection(),
              verticalSpace(30),
              button(
                context: context,
                function: () {
                  if (formKey.currentState!.validate()) {
                    widget.pageController.nextPage(
                        duration: Duration(milliseconds: 800.toInt()),
                        curve: Curves.fastLinearToSlowEaseIn);
                    formKey.currentState!.save();
                  }
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
