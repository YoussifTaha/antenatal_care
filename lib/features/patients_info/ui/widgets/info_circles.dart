import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoCircles extends StatelessWidget {
  final String title;
  final String info;
  final IconData icon;
  const InfoCircles({
    super.key,
    required this.title,
    required this.info,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: ColorManger.lightBackground,
          foregroundColor: ColorManger.primary,
          radius: 30,
          child: Icon(
            icon,
            size: 40,
          ),
        ),
        verticalSpace(10),
        Text(
          textAlign: TextAlign.center,
          title,
          style: getBoldStyle(
              color: ColorManger.darkPrimary,
              fontSize: 13.sp,
              textHeight: 1.1.h),
        ),
        verticalSpace(5),
        Text(
          info,
          style:
              getRegularStyle(color: ColorManger.regularGrey, fontSize: 12.sp),
        ),
      ],
    );
  }
}
