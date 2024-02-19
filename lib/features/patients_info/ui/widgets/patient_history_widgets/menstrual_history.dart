import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenstrualHistoryPage extends StatelessWidget {
  const MenstrualHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Menstrual History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(30),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Menarche',
                info: '',
                icon: Icons.water_drop,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   At the age of 11',
                style:
                    getBoldStyle(color: ColorManger.darkPrimary, fontSize: 16),
              ),
            )
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Frequency',
                info: '',
                icon: Icons.refresh,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   Each 28 days',
                style:
                    getBoldStyle(color: ColorManger.darkPrimary, fontSize: 16),
              ),
            )
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Regularity',
                info: '',
                icon: Icons.equalizer,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   Regular',
                style:
                    getBoldStyle(color: ColorManger.darkPrimary, fontSize: 16),
              ),
            )
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Duration',
                info: '',
                icon: Icons.timelapse,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   three to seven days',
                style:
                    getBoldStyle(color: ColorManger.darkPrimary, fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}
