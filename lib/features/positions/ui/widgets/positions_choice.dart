import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PositionsChoice extends StatelessWidget {
  final double animationValue;
  final String choice;
  final IconData icon;
  const PositionsChoice(
      {super.key,
      required this.choice,
      required this.icon,
      required this.animationValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      decoration: BoxDecoration(
        color: ColorManger.lightBackground,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
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
                            Icon(icon, size: 40),
                            horizontalSpace(10),
                            Text(
                              choice,
                              style: TextStyle(
                                fontSize: 14,
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
    );
  }
}
