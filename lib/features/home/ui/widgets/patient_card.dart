import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 144.w,
      height: 260.h,
      decoration: ShapeDecoration(
        color: ColorManger.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        children: [
          verticalSpace(5),
          const Icon(
            Icons.account_circle_rounded,
            color: ColorManger.primary,
            size: 60,
          ),
          verticalSpace(10),
          Text(
            'Menna Ahmed',
            style:
                getBoldStyle(color: ColorManger.darkPrimary, fontSize: 14.sp),
          ),
          verticalSpace(15),
          Text(
            'Week 25',
            style: getRegularStyle(
                color: ColorManger.darkPrimary, fontSize: 12.sp),
          ),
          verticalSpace(10),
          Image.asset(
            'assets/images/baby.png',
            height: 46.h,
            width: 46.h,
          ),
          verticalSpace(10),
          Text(
            'EDD: 12/3/2024',
            style:
                getBoldStyle(color: ColorManger.darkPrimary, fontSize: 14.sp),
          ),
          verticalSpace(10),
          Text(
            'Age : 27',
            style: getRegularStyle(
                color: ColorManger.darkPrimary, fontSize: 10.sp),
          ),
          verticalSpace(10),
          Text(
            'Occupation : House Wife',
            style: getRegularStyle(
                color: ColorManger.darkPrimary, fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
