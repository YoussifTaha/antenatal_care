import 'package:antenatal_app/core/Helpers/examination_input_controllers.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles_manager.dart';
import '../info_input_field.dart';

class EdemaExaminationQuestionRow extends StatelessWidget {
  const EdemaExaminationQuestionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ExaminationInputControllers examinationInputControllers =
        ExaminationInputControllers();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Eye lids Edema',
              style:
                  getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
            ),
            Text(
              'Lips Edema',
              style:
                  getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
            ),
            Text(
              'Cheecks Edema',
              style:
                  getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
            ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  InfoInputField(
                      controller: examinationInputControllers.eyeLidsController,
                      type: TextInputType.text,
                      validationMessage: 'This Field Cannot Be Empty'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  InfoInputField(
                      controller: examinationInputControllers.lipsController,
                      type: TextInputType.text,
                      validationMessage: 'This Field Cannot Be Empty'),
                ],
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                children: [
                  InfoInputField(
                      controller: examinationInputControllers.cheeksController,
                      type: TextInputType.text,
                      validationMessage: 'This Field Cannot Be Empty'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
