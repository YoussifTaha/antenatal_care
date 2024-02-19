import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastHistoryPage extends StatelessWidget {
  const PastHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Past History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(30),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Diseases (General or Specific)',
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
                title: 'Obstetric or gynecological opertions',
                info: '',
                icon: Icons.local_hotel_rounded,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   0',
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
                title: 'Trauma to abdomen or back',
                info: '',
                icon: Icons.warning_rounded,
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
      ],
    );
  }
}
