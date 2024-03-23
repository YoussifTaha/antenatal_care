import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/psychological_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddPsychologicalHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddPsychologicalHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddPsychologicalHistoryPage> createState() =>
      _AddPsychologicalHistoryPageState();
}

class _AddPsychologicalHistoryPageState
    extends State<AddPsychologicalHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController stressController = TextEditingController();
  TextEditingController emotionalController = TextEditingController();
  TextEditingController depressionController = TextEditingController();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Psychological History:',
                        style: getSemiBoldStyle(
                            color: Colors.black, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  BackIconButton(pageController: widget.pageController),
                ],
              ),
              verticalSpace(30),
              Text(
                'Any emotional disturbances',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: stressController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Anxiety or depression',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: emotionalController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Any stress to the patient during Pregnancy',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: depressionController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(30),
              BlocConsumer<HistoryCubit, HistoryState>(
                listener: (context, state) {
                  if (state is AddPatientHistorySuccsses) {
                    context.pushNamed(Routes.historyOrExaminationScreen,
                        arguments: {
                          'patientId': widget.patientId,
                        });
                  }
                  if (state is AddPatientHistoryError) {
                    showToast(text: state.error, state: ToastStates.error);
                  }
                },
                builder: (context, state) {
                  if (state is AddPatientHistoryLoadingState) {
                    return CircularProgressIndicator();
                  } else
                    return button(
                      context: context,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          PsychologicalHistoryModel psychologicalHistoryModel =
                              PsychologicalHistoryModel(
                                  emotions: emotionalController.text,
                                  anxiety: depressionController.text,
                                  stress: stressController.text);
                          HistoryCubit.get(context).addPsychologicalHistory(
                              patientId: widget.patientId,
                              psychologicalHistoryModel:
                                  psychologicalHistoryModel);
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
