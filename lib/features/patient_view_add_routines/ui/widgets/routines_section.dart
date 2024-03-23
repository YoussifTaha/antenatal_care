import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/patient_view_add_routines/ui/widgets/routines_content.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoutinesSection extends StatelessWidget {
  const RoutinesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      initiallyExpanded: false,
      titleBuilder: (double animationValue, _, bool isExpaned, toogleFunction) {
        return InkWell(
            onTap: () => toogleFunction(animated: true),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 60,
                    decoration: BoxDecoration(
                      color: ColorManger.lightBackground,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'My Routines',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Transform.rotate(
                                  angle: math.pi * animationValue / 2,
                                  child: Icon(Icons.arrow_right, size: 40),
                                  alignment: Alignment.center,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
      content: RoutinesContent(),
    );
  }
}
