import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingBackGroundImage extends StatelessWidget {
  const OnBoardingBackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 170.w,
        height: 340.h,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.white
                .withOpacity(0.08), // Adjust the opacity here (0.0 to 1.0)
            BlendMode.dstATop,
          ),
          child: CachedNetworkImage(
              imageUrl:
                  'https://raw.githubusercontent.com/madjoz60/antenatal_app_images/main/AAnn.png'),
        ),
      ),
    );
  }
}
