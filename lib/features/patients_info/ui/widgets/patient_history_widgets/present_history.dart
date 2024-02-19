import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PresentHistoryPage extends StatelessWidget {
  const PresentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Present History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(50),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Onset Of Complain',
                info: 'Acute',
                icon: Icons.personal_injury,
              ),
            ),
            horizontalSpace(0.1),
            Expanded(
              child: InfoCircles(
                title: 'Course',
                info: 'Progressive',
                icon: Icons.timelapse,
              ),
            ),
          ],
        ),
        verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Duration',
                info: '18 Days',
                icon: Icons.timer,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Date of Admission',
                info: '1/2/2024',
                icon: Icons.calendar_month,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
