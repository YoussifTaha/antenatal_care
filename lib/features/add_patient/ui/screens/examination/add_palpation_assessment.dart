import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/vital_signs_question_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPalpationAssessment extends StatelessWidget {
  final int patientId;
  final PageController pageController;
  const AddPalpationAssessment(
      {super.key, required this.pageController, required this.patientId});

  @override
  Widget build(BuildContext context) {
    var cubit = ExaminationCubit.get(context);
    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Palpation:',
                        style: getSemiBoldStyle(
                            color: Colors.black, fontSize: 20.sp),
                      ),
                    ],
                  ),
                  BackIconButton(pageController: pageController),
                ],
              ),
              verticalSpace(10),
              VitalSignsQuestionItem(
                  controller: cubit.fundusLevelController,
                  title: 'Fundus level test:',
                  icon: Icons.arrow_upward_rounded),
              verticalSpace(20),
              VitalSignsQuestionItem(
                  controller: cubit.rectusDiastasisController,
                  title: 'Rectus diastasis test:',
                  icon: Icons.space_bar_rounded),
              VitalSignsQuestionItem(
                  controller: cubit.edemaTestController,
                  title: 'Edema test:',
                  icon: Icons.water_drop_rounded),
              verticalSpace(30),
              BlocConsumer<ExaminationCubit, ExaminationState>(
                listener: (context, state) {
                  if (state is AddPatientExaminationSuccsses) {
                    context.pushNamed(Routes.historyOrExaminationScreen,
                        arguments: {
                          'patientId': patientId,
                        });
                  }
                  if (state is AddPatientExaminationError) {
                    showToast(text: state.error, state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  if (state is AddPatientExaminationLoadingState) {
                    return CircularProgressIndicator();
                  } else
                    return button(
                      context: context,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          ExaminationCubit.get(context).addPalpationExamination(
                            patientId: patientId,
                          );
                        }
                      },
                      text: 'Continue',
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
