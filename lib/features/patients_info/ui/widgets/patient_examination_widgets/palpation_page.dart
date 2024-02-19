import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PalpationScreen extends StatelessWidget {
  const PalpationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(20),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Palpation:',
              style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InfoCircles(
                  title: 'Fundus level test',
                  info: 'at the level of umbilicus',
                  icon: Icons.arrow_upward_rounded,
                ),
              ),
              Expanded(
                child: InfoCircles(
                  title: 'Rectus diastasis test',
                  info: 'Negative',
                  icon: Icons.space_bar_rounded,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: InfoCircles(
                  title: 'Edema test',
                  info: 'Grade 2 : Moderate pitting (4mm)',
                  icon: Icons.water_drop_rounded,
                ),
              ),
            ],
          ),
          verticalSpace(15),
        ],
      ),
    );
  }
}
