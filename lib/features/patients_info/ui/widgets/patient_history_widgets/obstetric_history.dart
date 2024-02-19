import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ObstetricHistoryPage extends StatelessWidget {
  const ObstetricHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Obstetric History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(50),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Previous Full Term Pregnancy',
                info: '2',
                icon: Icons.baby_changing_station_rounded,
              ),
            ),
            horizontalSpace(0.1),
            Expanded(
              child: InfoCircles(
                title: 'Gravidity',
                info: '5',
                icon: Icons.pregnant_woman_rounded,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Previous Abortion',
                info: '4',
                icon: Icons.local_hospital_rounded,
              ),
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Previous Living Children',
                info: 'False',
                icon: Icons.child_care_rounded,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Previous Premature Pregnancy',
                info: 'False',
                icon: Icons.woman_rounded,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
