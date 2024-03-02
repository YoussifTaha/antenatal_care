import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/examination_bloc_consumer.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/inspection_fields.dart';
import 'package:flutter/material.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';

class AddInspectionAssessment extends StatefulWidget {
  final PageController pageController;
  final int patientId;
  const AddInspectionAssessment({
    super.key,
    required this.pageController,
    required this.patientId,
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
              InspectionFields(),
              ExaminationBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ExaminationCubit.get(context).addInspectionExamination(
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
