import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddObstetricHistoryPage extends StatefulWidget {
  final PageController pageController;
  const AddObstetricHistoryPage({
    super.key,
    required this.pageController,
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
              button(
                context: context,
                function: () {
                  if (formKey.currentState!.validate()) {
                    widget.pageController.nextPage(
                        duration: Duration(milliseconds: 800.toInt()),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
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
