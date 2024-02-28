import 'package:flutter/material.dart';

class AssessmentTypeChoice extends StatelessWidget {
  final String choice;
  final IconData icon;
  const AssessmentTypeChoice(
      {super.key, required this.choice, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                choice,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
