import 'package:antenatal_app/core/Helpers/examination_input_controllers.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddIcontinenceSection extends StatelessWidget {
  const AddIcontinenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    ExaminationInputControllers examinationInputControllers =
        ExaminationInputControllers();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Icontinence Assessment (Pelvic Floor Muscle Strength) :',
          style: getSemiBoldStyle(color: Colors.black, fontSize: 18.sp),
        ),
        verticalSpace(30),
        Text(
          'Ask client to squeeze fingers as much as possible & strength of perineal muscles is checked',
          style: getRegularStyle(
              color: ColorManger.primary, fontSize: 16.sp, textHeight: 1.1.h),
        ),
        verticalSpace(20),
        Text(
          'Grade 1 =  Contraction held less than 1 second',
          style: getRegularStyle(
              color: ColorManger.regularGrey,
              fontSize: 14.sp,
              textHeight: 1.1.h),
        ),
        verticalSpace(20),
        Text(
          'Grade 2 =  Contraction held for 1-3 seconds or fingers not elevated',
          style: getRegularStyle(
              color: ColorManger.regularGrey,
              fontSize: 14.sp,
              textHeight: 1.1.h),
        ),
        verticalSpace(20),
        Text(
          'Grade 3 =  Contraction held for 4-6 seconds and fingers elevated; repeat 3 times',
          style: getRegularStyle(
              color: ColorManger.regularGrey,
              fontSize: 14.sp,
              textHeight: 1.1.h),
        ),
        verticalSpace(20),
        Text(
          'Grade 4 =  Contraction held for 7-9 seconds and fingers elevated; repeat 3 times',
          style: getRegularStyle(
              color: ColorManger.regularGrey,
              fontSize: 14.sp,
              textHeight: 1.1.h),
        ),
        verticalSpace(20),
        Text(
          'Grade 5 =  Rapid contraction with elevation of fingers for 7-9 seconds; repeat 4 times',
          style: getRegularStyle(
              color: ColorManger.regularGrey,
              fontSize: 14.sp,
              textHeight: 1.1.h),
        ),
        verticalSpace(30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Record Patient\'s Grade',
              style:
                  getSemiBoldStyle(color: ColorManger.primary, fontSize: 16.sp),
            ),
            verticalSpace(10),
            InfoInputField(
                controller:
                    examinationInputControllers.incontinenceGradeController,
                type: TextInputType.text,
                validationMessage: 'This Field Cannot Be Empty'),
          ],
        ),
      ],
    );
  }
}
