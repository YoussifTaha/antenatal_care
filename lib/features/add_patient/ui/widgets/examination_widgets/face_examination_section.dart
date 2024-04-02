import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/examination_widgets/edema_examination_question_row.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaceExaminationSection extends StatelessWidget {
  const FaceExaminationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = ExaminationCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Face:',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 18.sp),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              children: [
                Icon(
                  Icons.face,
                  color: ColorManger.primary,
                  size: 30,
                ),
              ],
            )
          ],
        ),
        verticalSpace(20),
        Text(
          'Fascial expression',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.fascialExpressionController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Color',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.colorController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(30),
        Text(
          'Answer the following questions with yes or no',
          style: getRegularStyle(color: Colors.black, fontSize: 14.sp),
        ),
        verticalSpace(20),
        EdemaExaminationQuestionRow(),
        verticalSpace(20),
        Text(
          'Preclampsia',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.preclampsiaController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Pigmentation(cloasma)',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.cloasmaController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
      ],
    );
  }
}