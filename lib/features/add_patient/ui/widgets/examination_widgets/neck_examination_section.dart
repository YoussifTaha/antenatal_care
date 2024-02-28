import 'package:antenatal_app/core/Helpers/examination_input_controllers.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeckExaminationSection extends StatelessWidget {
  const NeckExaminationSection({
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
                  'Neck:',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 18.sp),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              children: [
                Icon(
                  Icons.nest_cam_wired_stand,
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
          'Thyroid enlargement',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: examinationInputControllers.thyroidController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Pulsating neck veins',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: examinationInputControllers.veinsController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
      ],
    );
  }
}
