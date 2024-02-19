import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncontinencePage extends StatelessWidget {
  const IncontinencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(40),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Incontinence:',
              style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          verticalSpace(40),
          Row(
            children: [
              InfoCircles(
                title: 'Patient\'s Grade',
                info: 'Grade 3',
                icon: Icons.format_list_numbered_rounded,
              ),
              horizontalSpace(40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'the patient can hold contraction of Pelvic Floor Muscles for 4-6 seconds with fingers elevated.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary,
                          fontSize: 16,
                          textHeight: 1.5.h),
                    ),
                    verticalSpace(8),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
