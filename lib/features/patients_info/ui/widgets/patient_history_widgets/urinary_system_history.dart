import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UrineSystemHistoryPage extends StatelessWidget {
  const UrineSystemHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Urine System History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(50),
        Row(
          children: [
            Expanded(
              child: InfoCircles(
                title: 'Burning Sensations During Micturition',
                info: 'Not Found',
                icon: Icons.local_fire_department,
              ),
            ),
            horizontalSpace(0.1),
            Expanded(
              child: InfoCircles(
                title: 'Retention Of Urine',
                info: 'Found',
                icon: Icons.warning_rounded,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Polyuria',
                info: 'Found',
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
                title:
                    'Dribbling of urine during coughing, or other activities',
                info: 'Not Found',
                icon: Icons.water_drop_rounded,
              ),
            ),
            Expanded(
              child: InfoCircles(
                title: 'Feeling of something descending down per vagina',
                info: 'Not Found',
                icon: Icons.female,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
