import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/history_bloc_consumer.dart';
import 'package:antenatal_app/features/patients_info/data/models/history_models/urine_system_history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddUrineSystemHistoryPage extends StatefulWidget {
  final int patientId;
  final PageController pageController;
  const AddUrineSystemHistoryPage({
    super.key,
    required this.pageController,
    required this.patientId,
  });

  @override
  State<AddUrineSystemHistoryPage> createState() =>
      _AddUrineSystemHistoryPageState();
}

class _AddUrineSystemHistoryPageState extends State<AddUrineSystemHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController burningController = TextEditingController();
  TextEditingController retentionController = TextEditingController();
  TextEditingController polyuriaController = TextEditingController();
  TextEditingController dribblingController = TextEditingController();
  TextEditingController descendingController = TextEditingController();

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
                        'Urine System History:',
                        style: getSemiBoldStyle(
                            color: Colors.black, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  BackIconButton(pageController: widget.pageController)
                ],
              ),
              verticalSpace(30),
              Text(
                'Burning Sensations During Micturition',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: burningController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Retention Of Urine',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: retentionController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Polyuria',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: polyuriaController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Dribbling of urine during coughing, or other activities',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: dribblingController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Feeling of something descending down per vagina',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: descendingController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(30),
              HistoryBlocConsumer(
                  button: button(
                    context: context,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        UrineSystemHistoryModel urineSystemHistoryModel =
                            UrineSystemHistoryModel(
                                burning: burningController.text,
                                retention: retentionController.text,
                                polyuria: polyuriaController.text,
                                dribbling: dribblingController.text,
                                feeling: descendingController.text);
                        HistoryCubit.get(context).addUrinarySystemHistory(
                            patientId: widget.patientId,
                            urineSystemHistoryModel: urineSystemHistoryModel);
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
