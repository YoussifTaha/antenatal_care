import 'package:antenatal_app/features/add_patient/ui/widgets/back_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';

class AddFamilyHistoryPage extends StatefulWidget {
  final PageController pageController;
  const AddFamilyHistoryPage({
    super.key,
    required this.pageController,
  });

  @override
  State<AddFamilyHistoryPage> createState() => _AddFamilyHistoryPageState();
}

class _AddFamilyHistoryPageState extends State<AddFamilyHistoryPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController certainDiseasesController = TextEditingController();
  TextEditingController consanguinityController = TextEditingController();
  TextEditingController twinsController = TextEditingController();

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
                        'Family History:',
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
                'Certain Diseases',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: certainDiseasesController,
                  type: TextInputType.text,
                  validationMessage: 'Certain Diseases Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'Consanguinity Marriage',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: consanguinityController,
                  type: TextInputType.text,
                  validationMessage:
                      'Consanguinity marriage Field Cannot Be Empty'),
              verticalSpace(20),
              Text(
                'History of Twins',
                style: getSemiBoldStyle(
                    color: ColorManger.primary, fontSize: 14.sp),
              ),
              verticalSpace(10),
              InfoInputField(
                  controller: twinsController,
                  type: TextInputType.text,
                  validationMessage: 'History of Twins Field Cannot Be Empty'),
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
