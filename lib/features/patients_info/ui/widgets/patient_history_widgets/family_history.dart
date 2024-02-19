import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyHistoryPage extends StatelessWidget {
  const FamilyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Family History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(30),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Certain diseases',
                info: '',
                icon: Icons.healing,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   Not Found',
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
                title: 'Consanguinity marriage',
                info: '',
                icon: Icons.family_restroom_rounded,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   False',
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
                title: 'History of twins',
                info: '',
                icon: Icons.people_alt,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   False',
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
