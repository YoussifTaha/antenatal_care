import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/components.dart';
import 'package:antenatal_app/features/onBoarding/ui/widgets/background_image.dart';
import 'package:antenatal_app/features/onBoarding/ui/widgets/female_doctor_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Stack(
        children: [
          const OnBoardingBackGroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 30.h),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Physical Therapy Antenatal Care',
                    style: getBoldStyle(
                        color: ColorManger.darkPrimary, fontSize: 16.sp),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const FemaleDoctorImage(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Follow up with your own physiotherapist and take care of yourself and the baby',
                      textAlign: TextAlign.center,
                      style: getRegularStyle(
                        color: ColorManger.regularGrey,
                        textHeight: 1.2.h,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  button(
                      height: 50,
                      context: context,
                      function: () {},
                      text: 'Get Started',
                      color: ColorManger.primary)
                ],
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
