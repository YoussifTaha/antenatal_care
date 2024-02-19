import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/patients_info/ui/widgets/info_circles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InspectionScreen extends StatelessWidget {
  const InspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          verticalSpace(20),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Inspection:',
              style: getBoldStyle(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          verticalSpace(20),
          Row(
            children: [
              InfoCircles(
                title: 'Face',
                info: '',
                icon: Icons.face_4_rounded,
              ),
              horizontalSpace(40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fascial expression:  Normal.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Color: Pale.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Edema of eye lids: No , lips: No, cheecks: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'preclampsia: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Pigmentation(cloasma) : No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              InfoCircles(
                title: 'Neck',
                info: '',
                icon: Icons.nest_cam_wired_stand,
              ),
              horizontalSpace(40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thyroid enlargement:  No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Pulsating neck veins: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              InfoCircles(
                title: 'Abdomen',
                info: '',
                icon: Icons.pregnant_woman_rounded,
              ),
              horizontalSpace(40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Linea nigra:  No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Striae gravidarum (stretch marks): No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Scar on abdomen: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              InfoCircles(
                title: 'Lower limbs',
                info: '',
                icon: Icons.airline_seat_legroom_reduced_outlined,
              ),
              horizontalSpace(20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deformity: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Varicose veins: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Oedema: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Row(
            children: [
              InfoCircles(
                title: 'Breast',
                info: '',
                icon: Icons.female,
              ),
              horizontalSpace(40),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Size (enlargement):  Normal.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Slight elevation of skin temperature: Pale.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Hyper pigmentation of primary areola: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(8),
                    Text(
                      'Appearance of secondary areola: No.',
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 16),
                    ),
                    verticalSpace(15),
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
