import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddPastHistoryPage extends StatefulWidget {
  final PageController pageController;
  const AddPastHistoryPage({
    super.key,
    required this.pageController,
  });

  @override
  State<AddPastHistoryPage> createState() => _AddPastHistoryPageState();
}

class _AddPastHistoryPageState extends State<AddPastHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController diseasesController = TextEditingController();
  TextEditingController operationsController = TextEditingController();
  TextEditingController traumaController = TextEditingController();

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
                        'Past History:',
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
                'Diseases (General or Specific)',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: diseasesController,
                  type: TextInputType.text,
                  validationMessage: 'Diseases Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Obstetric or gynecological opertions',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: operationsController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Trauma to abdomen or back',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: traumaController,
                  type: TextInputType.text,
                  validationMessage: 'This Field Cannot Be Empty'),
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
