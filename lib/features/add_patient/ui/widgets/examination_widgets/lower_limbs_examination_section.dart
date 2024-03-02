import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/widgets/info_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LowerLimbsExaminationSection extends StatelessWidget {
  const LowerLimbsExaminationSection({
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
                  'Lower Limbs:',
                  style: getSemiBoldStyle(
                      color: ColorManger.primary, fontSize: 18.sp),
                ),
              ],
            ),
            horizontalSpace(20),
            Column(
              children: [
                Icon(
                  Icons.airline_seat_legroom_reduced_outlined,
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
          'Deformity',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.deformityController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Varicose veins',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.varicoseVeinsController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
        verticalSpace(20),
        Text(
          'Oedema',
          style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 14.sp),
        ),
        verticalSpace(10),
        InfoInputField(
            controller: cubit.oedemaController,
            type: TextInputType.text,
            validationMessage: 'This Field Cannot Be Empty'),
      ],
    );
  }
}
