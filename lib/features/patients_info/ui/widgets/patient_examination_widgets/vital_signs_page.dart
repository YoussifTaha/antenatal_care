import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VitalSignsPage extends StatelessWidget {
  const VitalSignsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(20),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Vital Signs:',
              style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InfoCircles(
                  title: 'Blood Pressure',
                  info: '120/80 mm Hg',
                  icon: Icons.water_drop_rounded,
                ),
              ),
              Expanded(
                child: InfoCircles(
                  title: 'Heart Rate',
                  info: '80 BPM',
                  icon: Icons.favorite_border_rounded,
                ),
              ),
            ],
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: InfoCircles(
                  title: 'Pulse rate',
                  info: '80 BPM',
                  icon: Icons.area_chart_rounded,
                ),
              ),
              Expanded(
                child: InfoCircles(
                  title: 'Respiratory Rate',
                  info: '12-20 breaths per minute',
                  icon: Icons.timeline,
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
