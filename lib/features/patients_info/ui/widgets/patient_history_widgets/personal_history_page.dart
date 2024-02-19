import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalHistoryPage extends StatelessWidget {
  const PersonalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Personal History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(15),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Marital status : Married',
            style: getRegularStyle(
                color: ColorManger.regularGrey, fontSize: 14.sp),
          ),
        ),
        verticalSpace(5),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Duration of marriage : 10 Years',
            style: getRegularStyle(
                color: ColorManger.regularGrey, fontSize: 14.sp),
          ),
        ),
        verticalSpace(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoCircles(
              title: 'Parity Count',
              info: '2',
              icon: Icons.pregnant_woman_rounded,
            ),
            horizontalSpace(0.1),
            InfoCircles(
              title: 'Completed Sessions',
              info: '5',
              icon: Icons.numbers,
            ),
            InfoCircles(
              title: 'Current Month',
              info: '4',
              icon: Icons.calendar_month_rounded,
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Smoking',
                info: 'False',
                icon: Icons.smoking_rooms_rounded,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Alchohol',
                info: 'False',
                icon: Icons.local_bar_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
