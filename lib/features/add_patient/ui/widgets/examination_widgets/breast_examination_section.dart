import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreastExaminationSection extends StatelessWidget {
  const BreastExaminationSection({
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
                  'Breast:',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 18.sp),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              children: [
                Icon(
                  Icons.female,
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
          'Size (enlargement)',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.sizeController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Slight elevation of skin temperature',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.skinTemperatureController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Hyper pigmentation of primary areola',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.primaryAreolaController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Appearance of secondary areola',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.secondaryAreolaController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
      ],
    );
  }
}
