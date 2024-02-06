import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return defaultform(
        fillColor: ColorManger.moreLightGray,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: ColorManger.lightGray,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: ColorManger.primary,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(
              color: Colors.red,
            )),
        prefixIconColor: ColorManger.primary,
        labelStyle: const TextStyle(
          color: ColorManger.primary,
        ),
        textStyle: const TextStyle(
          color: ColorManger.primary,
        ),
        controller: (emailController),
        type: TextInputType.emailAddress,
        validate: (value) {
          if (value!.isEmpty) {
            return "Email Address Cannot Be Empty";
          }
          return null;
        },
        labeltext: "Email Address",
        prefix: Icons.email);
  }
}
