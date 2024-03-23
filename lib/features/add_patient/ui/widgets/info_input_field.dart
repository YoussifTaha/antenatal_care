import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/widgets.dart';

class InfoInputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String validationMessage;
  final String? hintText;
  const InfoInputField(
      {super.key,
      required this.controller,
      required this.type,
      required this.validationMessage,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return defaultForm(
      onSaved: (newValue) {
        controller.text = newValue!;
      },
      hintText: hintText,
      fillColor: ColorManger.lightBackground.withOpacity(0.6),
      controller: controller,
      type: type,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: BorderSide(
          color: ColorManger.lightPrimary.withOpacity(0.4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: ColorManger.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.0),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
      validate: (value) {
        if (value!.isEmpty) {
          return validationMessage;
        }
        return null;
      },
    );
  }
}
