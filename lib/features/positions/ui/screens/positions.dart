import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/positions/ui/widgets/driving_widget.dart';
import 'package:antenatal_app/features/positions/ui/widgets/lifting_widget.dart';
import 'package:antenatal_app/features/positions/ui/widgets/positions_expanded_widget.dart';
import 'package:antenatal_app/features/positions/ui/widgets/sitting_widget.dart';
import 'package:antenatal_app/features/positions/ui/widgets/sleeping_widget.dart';
import 'package:antenatal_app/features/positions/ui/widgets/standing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PositionsScreen extends StatelessWidget {
  const PositionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Positions Recommendations',
          style: getBoldStyle(color: Colors.black, fontSize: 16.sp),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(20),
              Text(
                '●  Posture is the position in which you hold your body while standing, sitting or lying down. Good posture during pregnancy involves training your body to stand, walk, sit and lie in positions where the least strain is placed on your back',
                style: getMediumStyle(
                    color: ColorManger.darkPrimary,
                    fontSize: 16.sp,
                    textHeight: 1.3),
              ),
              verticalSpace(20),
              PositionsExpandedWidget(
                choice: 'How To Stand Properly',
                icon: Icons.pregnant_woman,
                description: StandingWidget(),
              ),
              verticalSpace(20),
              PositionsExpandedWidget(
                choice: 'How To Sit Properly',
                icon: Icons.airline_seat_recline_normal_sharp,
                description: SittingWidget(),
              ),
              verticalSpace(20),
              PositionsExpandedWidget(
                choice: 'How To Drive Properly',
                icon: Icons.drive_eta,
                description: DrivingWidget(),
              ),
              verticalSpace(20),
              PositionsExpandedWidget(
                choice: 'How To Lift Objects Properly',
                icon: Icons.home_repair_service_rounded,
                description: LiftingWidget(),
              ),
              verticalSpace(20),
              PositionsExpandedWidget(
                choice: 'How To Sleep Properly',
                icon: Icons.airline_seat_flat,
                description: SleepingWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
