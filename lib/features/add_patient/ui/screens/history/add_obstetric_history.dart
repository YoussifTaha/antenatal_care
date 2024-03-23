import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/history_bloc_consumer.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/obstetric_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddObstetricHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddObstetricHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddObstetricHistoryPage> createState() =>
      _AddObstetricHistoryPageState();
}

class _AddObstetricHistoryPageState extends State<AddObstetricHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController pregnancyController = TextEditingController();
  TextEditingController gravidityController = TextEditingController();
  TextEditingController abortionController = TextEditingController();
  TextEditingController livingChildrenController = TextEditingController();
  TextEditingController prematurePregnancyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
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
                        'Obstetric History:',
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
                'Previous Full Term Pregnancy',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: pregnancyController,
                  type: TextInputType.number,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Gravidity',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: gravidityController,
                  type: TextInputType.number,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Previous Abortion',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: abortionController,
                  type: TextInputType.number,
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
                  type: TextInputType.number,
                  validationMessage: 'This Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Previous Premature Pregnancy',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: prematurePregnancyController,
                  type: TextInputType.number,
                  validationMessage: 'This Cannot Be Empty'),
              verticalSpace(30),
              HistoryBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ObstetricHistoryModel obstetricHistoryModel =
                            ObstetricHistoryModel(
                                fullTermPregnancy: pregnancyController.text,
                                gravidity: gravidityController.text,
                                previousAbortion: abortionController.text,
                                previousLivingChildren:
                                    livingChildrenController.text,
                                previousPrematurePregnancy:
                                    prematurePregnancyController.text);
                        HistoryCubit.get(context).addObstetricHistory(
                            patientId: widget.patientId,
                            obstetricHistoryModel: obstetricHistoryModel);
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
