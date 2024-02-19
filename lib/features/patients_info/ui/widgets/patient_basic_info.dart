import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientBsicInfo extends StatelessWidget {
  const PatientBsicInfo({super.key});

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
                  radius: 35,
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),
              ],
            ),
            horizontalSpace(18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Menna Ahmed',
                  style: getBoldStyle(color: Colors.black, fontSize: 15.sp),
                ),
                verticalSpace(8),
                Text(
                  'Age : 27 |  Occupation : House wife',
                  style: getMediumStyle(
                      color: ColorManger.regularGrey, fontSize: 13.sp),
                ),
                verticalSpace(5),
                Text(
                  'Address : 21 shar3 elma7kma',
                  style: getRegularStyle(
                      color: ColorManger.regularGrey.withOpacity(0.8),
                      fontSize: 11.sp),
                ),
              ],
            ),
          ],
        ),
        verticalSpace(15),
        Text(
          'Chief Complain : Low Back Pain',
          style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
        ),
        verticalSpace(15),
        Text(
          'EDD: 12/3/2024',
          style: getRegularStyle(color: Colors.black, fontSize: 12.sp),
        ),
        verticalSpace(10),
        Image.asset(
          'assets/images/baby.png',
          height: 70.h,
          width: 70.h,
        ),
        verticalSpace(10),
        Text(
          'Week 25',
          style:
              getRegularStyle(color: ColorManger.regularGrey, fontSize: 12.sp),
        ),
        verticalSpace(15),
        Text(
          'First Session At : 2/14/2024',
          style:
              getRegularStyle(color: ColorManger.regularGrey, fontSize: 15.sp),
        ),
        verticalSpace(10),
      ],
    );
  }
}
