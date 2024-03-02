import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPatientsTwoButtonsRow extends StatelessWidget {
  const AddPatientsTwoButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        button(
            height: 35.h,
            textColor: ColorManger.primary,
            color: Colors.white,
            fontSize: 12.sp,
            width: 192.w,
            context: context,
            function: () {
              context.pushNamed(Routes.addBasicInfoScreen);
            },
            text: 'Add By Id'),
      ],
    );
  }
}
