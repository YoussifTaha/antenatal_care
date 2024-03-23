import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoutinesQuestionAndButton extends StatelessWidget {
  final String question;
  final TimeOfDay? time;
  final VoidCallback setTime;
  const RoutinesQuestionAndButton(
      {super.key,
      required this.question,
      required this.time,
      required this.setTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: getBoldStyle(
              color: ColorManger.darkPrimary,
              fontSize: 14.sp,
              textHeight: 1.2.h),
        ),
        verticalSpace(5),
        time == null
            ? Text(
                'Not Added Yet',
                style: getRegularStyle(
                        color: ColorManger.regularGrey.withOpacity(0.8),
                        fontSize: 16.sp)
                    .copyWith(fontStyle: FontStyle.italic),
              )
            : Text(
                time!.format(context),
                style: getRegularStyle(color: Colors.black, fontSize: 16.sp),
              ),
        verticalSpace(15),
        outlinedButton(height: 50.h, function: setTime, text: 'Set Time'),
        verticalSpace(20),
      ],
    );
  }
}
