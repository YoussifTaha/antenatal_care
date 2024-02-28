import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VitalSignsQuestionItem extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final IconData icon;
  const VitalSignsQuestionItem(
      {super.key,
      required this.controller,
      required this.title,
      required this.icon,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 16.sp),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              children: [
                Icon(
                  icon,
                  color: ColorManger.primary,
                  size: 30,
                ),
              ],
            )
          ],
        ),
        verticalSpace(10),
        InfoInputField(
            hintText: hintText,
            controller: controller,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
      ],
    );
  }
}
