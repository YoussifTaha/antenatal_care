import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/history_bloc_consumer.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/present_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddPresentHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddPresentHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddPresentHistoryPage> createState() => _AddPresentHistoryPageState();
}

class _AddPresentHistoryPageState extends State<AddPresentHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController onsetOfComplainStatusController =
      TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController dateOfAdmissionController = TextEditingController();
  TextEditingController alchoholController = TextEditingController();

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
                        'Present History:',
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
                'Onset Of Complain',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: onsetOfComplainStatusController,
                  type: TextInputType.text,
                  validationMessage: 'Onset Of Complain Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Course',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: courseController,
                  type: TextInputType.text,
                  validationMessage: 'Course Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Duration',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: durationController,
                  type: TextInputType.text,
                  validationMessage: 'Duration Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Date of Admission',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: dateOfAdmissionController,
                  type: TextInputType.text,
                  validationMessage: 'Date of Admission Field Cannot Be Empty'),
              verticalSpace(30),
              HistoryBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        PresentHistoryModel presentHistoryModel =
                            PresentHistoryModel(
                                onsetOfComplain:
                                    onsetOfComplainStatusController.text,
                                course: courseController.text,
                                duration: durationController.text,
                                dateOfAdmission:
                                    dateOfAdmissionController.text);
                        HistoryCubit.get(context).addPresentHistory(
                            patientId: widget.patientId,
                            presentHistoryModel: presentHistoryModel);
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
