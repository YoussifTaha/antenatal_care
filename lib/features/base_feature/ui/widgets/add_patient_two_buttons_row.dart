import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPatientsTwoButtonsRow extends StatelessWidget {
  const AddPatientsTwoButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(
            height: 35.h,
            textColor: ColorManger.primary,
            color: Colors.white,
            fontSize: 12.sp,
            width: 100.h,
            context: context,
            function: () {},
            text: 'Add By Id'),
        outlinedButton(
            fontSize: 12.sp,
            textColor: Colors.white,
            color: Colors.white,
            height: 39.h,
            width: 120.w,
            function: () {},
            text: 'Add Manually'),
      ],
    );
  }
}
