import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/history_bloc_consumer.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/personal_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddPersonalHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddPersonalHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddPersonalHistoryPage> createState() => _AddPersonalHistoryPageState();
}

class _AddPersonalHistoryPageState extends State<AddPersonalHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController maritalStatusController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController parityController = TextEditingController();
  TextEditingController smokingController = TextEditingController();
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
                        'Personal History:',
                        style: getSemiBoldStyle(
                            color: Colors.black, fontSize: 18.sp),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpace(30),
              Text(
                'Marital Status',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: maritalStatusController,
                  type: TextInputType.text,
                  validationMessage: 'Marital status Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Duration of Marriage',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: durationController,
                  type: TextInputType.text,
                  validationMessage:
                      'Duration of marriage Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Parity',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: parityController,
                  type: TextInputType.text,
                  validationMessage: 'Parity Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Smoking',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: smokingController,
                  type: TextInputType.text,
                  validationMessage: 'Smoking Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Alchohol',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: alchoholController,
                  type: TextInputType.text,
                  validationMessage: 'Alchohol Field Cannot Be Empty'),
              verticalSpace(30),
              HistoryBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        PersonalHistoryModel personalHistoryModel =
                            PersonalHistoryModel(
                                parityCount: parityController.text,
                                maritalStatus: maritalStatusController.text,
                                mariageDuration: durationController.text,
                                smoking: smokingController.text,
                                alchohol: alchoholController.text);
                        HistoryCubit.get(context).addPersonalHistory(
                            patientId: widget.patientId,
                            personalHistoryModel: personalHistoryModel);
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
