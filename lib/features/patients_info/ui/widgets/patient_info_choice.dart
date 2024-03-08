import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class PatientInfoChoice extends StatelessWidget {
  final String choice;
  final IconData icon;
  const PatientInfoChoice(
      {super.key, required this.choice, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60,
      decoration: BoxDecoration(
        color: ColorManger.lightBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Icon(icon),
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
        ),
      ),
    );
  }
}
