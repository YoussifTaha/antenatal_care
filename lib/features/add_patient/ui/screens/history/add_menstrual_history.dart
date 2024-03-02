import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/history_bloc_consumer.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/menstrual_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddMenstrualHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddMenstrualHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddMenstrualHistoryPage> createState() =>
      _AddMenstrualHistoryPageState();
}

class _AddMenstrualHistoryPageState extends State<AddMenstrualHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController menarcheController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController regularityController = TextEditingController();
  TextEditingController livingChildrenController = TextEditingController();
  TextEditingController durationController = TextEditingController();

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
                        'Menstrual History:',
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
                'Menarche',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: menarcheController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Frequency',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: frequencyController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Regularity',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: regularityController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Previous Living Children',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: livingChildrenController,
                  type: TextInputType.text,
                  validationMessage: 'This Cannot Be Empty'),
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
                  validationMessage: 'This Cannot Be Empty'),
              verticalSpace(30),
              HistoryBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        MenstrualHistoryModel menstrualHistoryModel =
                            MenstrualHistoryModel(
                                menarche: menarcheController.text,
                                frequency: frequencyController.text,
                                regularity: regularityController.text,
                                duration: durationController.text);
                        HistoryCubit.get(context).addMenstrualHistory(
                            patientId: widget.patientId,
                            menstrualHistoryModel: menstrualHistoryModel);
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
