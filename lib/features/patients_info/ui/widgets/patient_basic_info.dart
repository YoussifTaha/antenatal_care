import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientBsicInfo extends StatelessWidget {
  final UserModel patient;
  const PatientBsicInfo({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: ColorManger.primary,
                  foregroundColor: Colors.white,
                  radius: 45,
                  child: Icon(
                    Icons.person,
                    size: 55,
                  ),
                ),
              ],
            ),
            horizontalSpace(18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.fullName,
                    style: getBoldStyle(color: Colors.black, fontSize: 15.sp),
                  ),
                  verticalSpace(10),
                  Text(
                    'Age : ${patient.fullName} |  Occupation : ${patient.occupation}',
                    style: getMediumStyle(
                        color: ColorManger.regularGrey, fontSize: 13.sp),
                  ),
                  verticalSpace(8),
                  Text(
                    'Address : ${patient.address}',
                    style: getRegularStyle(
                        color: ColorManger.regularGrey.withOpacity(0.8),
                        fontSize: 11.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(30),
        Text(
          'Chief Complain : ${patient.chiefComplain}',
          style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
        ),
        verticalSpace(20),
        Text(
          'EDD: ${patient.eDD}',
          style: getRegularStyle(color: Colors.black, fontSize: 12.sp),
        ),
        verticalSpace(20),
        Image.asset(
          'assets/images/baby.png',
          height: 100.h,
          width: 100.h,
        ),
        verticalSpace(15),
        Text(
          'Week ${patient.weekNumber}',
          style:
              getRegularStyle(color: ColorManger.regularGrey, fontSize: 12.sp),
        ),
        verticalSpace(20),
        Text(
          'First Session At : ${patient.firstSessionDate}',
          style:
              getRegularStyle(color: ColorManger.regularGrey, fontSize: 15.sp),
        ),
        verticalSpace(30),
      ],
    );
  }
}
