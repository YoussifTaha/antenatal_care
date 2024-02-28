import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddPsychologicalHistoryPage extends StatefulWidget {
  final PageController pageController;
  const AddPsychologicalHistoryPage({
    super.key,
    required this.pageController,
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
              button(
                context: context,
                function: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
