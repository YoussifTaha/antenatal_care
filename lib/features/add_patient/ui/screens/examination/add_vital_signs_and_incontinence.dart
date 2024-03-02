import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/add_incontinence_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/add_vital_signs_section.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/examination_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';

class AddVitalSignsAssessment extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddVitalSignsAssessment({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddVitalSignsAssessment> createState() =>
      _AddVitalSignsAssessmentState();
}

class _AddVitalSignsAssessmentState extends State<AddVitalSignsAssessment> {
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
              AddVitalSignsSection(pageController: widget.pageController),
              verticalSpace(20),
              myVerticalDivider(),
              verticalSpace(20),
              AddIcontinenceSection(),
              verticalSpace(30),
              ExaminationBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ExaminationCubit.get(context).addVitalSignsExamination(
                          patientId: widget.patientId,
                        );
                        ExaminationCubit.get(context)
                            .addIncontinenceExamination(
                          patientId: widget.patientId,
                        );
                      }
                    },
                    text: 'Next',
                  ),
                  pageController: widget.pageController),
            ],
          ),
        ),
      ),
    );
  }
}
