import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FemaleDoctorImage extends StatelessWidget {
  const FemaleDoctorImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 430.w,
          height: 550.h,
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.14, 0.45],
                colors: [Colors.white, Colors.white.withOpacity(0.0)]),
          ),
          child: Image.asset('assets/images/femdoc.png'),
        ),
        Positioned(
          bottom: 10,
          width: 350.w,
          child: Text(
            'Application For Every Mother',
            textAlign: TextAlign.center,
            style: getBoldStyle(color: ColorManger.primary, fontSize: 32.sp),
          ),
        ),
      ],
    );
  }
}
// Align(
//             alignment: Alignment.bottomCenter,
//             child: Text(
//               'Application For Every Mother',
//               textAlign: TextAlign.center,
//               style:
//                   getBoldStyle(color: ColorManger.darkPrimary, fontSize: 32.sp),
//             ),
//           ),