import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PsychologicalHistoryPage extends StatelessWidget {
  const PsychologicalHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(20),
        SizedBox(
          width: double.infinity,
          child: Text(
            'Psychological History:',
            style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
          ),
        ),
        verticalSpace(30),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: InfoCircles(
                title: 'Any emotional disturbances',
                info: '',
                icon: Icons.sentiment_dissatisfied_outlined,
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
                title: 'Anxiety or depression',
                info: '',
                icon: Icons.psychology_alt_rounded,
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
                title: 'Any stress to the patient during Pregnancy',
                info: '',
                icon: Icons.attribution_rounded,
              ),
            ),
            horizontalSpace(20),
            Expanded(
              flex: 2,
              child: Text(
                ':   Found',
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
