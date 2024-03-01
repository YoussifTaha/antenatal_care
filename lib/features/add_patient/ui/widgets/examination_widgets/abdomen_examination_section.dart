import 'package:antenatal_app/core/Helpers/examination_input_controllers.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AbdomenExaminationSection extends StatelessWidget {
  const AbdomenExaminationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ExaminationInputControllers examinationInputControllers =
        ExaminationInputControllers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Abdomen:',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 18.sp),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              children: [
                Icon(
                  Icons.pregnant_woman_rounded,
                  color: ColorManger.primary,
                  size: 30,
                ),
              ],
            )
          ],
        ),
        verticalSpace(20),
        Text(
          'Answer the following questions with yes or no',
          style: getRegularStyle(color: Colors.black, fontSize: 14.sp),
        ),
        verticalSpace(20),
        Text(
          'Linea nigra',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: examinationInputControllers.lineaNigraController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Striae gravidarum (stretch marks)',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: examinationInputControllers.stretchMarksController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Scar on abdomen',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: examinationInputControllers.scarsController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
      ],
    );
  }
}