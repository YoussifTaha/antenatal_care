import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientCard extends StatelessWidget {
  final UserModel patient;
  const PatientCard({super.key, required this.patient});

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
            patient.fullName,
            style:
                getBoldStyle(color: ColorManger.darkPrimary, fontSize: 14.sp),
          ),
          verticalSpace(15),
          Text(
            'Week: ${patient.weekNumber}',
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
            'EDD: ${patient.eDD}',
            style:
                getBoldStyle(color: ColorManger.darkPrimary, fontSize: 14.sp),
          ),
          verticalSpace(10),
          Text(
            'Age : ${patient.age}',
            style: getRegularStyle(
                color: ColorManger.darkPrimary, fontSize: 10.sp),
          ),
          verticalSpace(10),
          Text(
            'Occupation : ${patient.occupation}',
            style: getRegularStyle(
                color: ColorManger.darkPrimary, fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
