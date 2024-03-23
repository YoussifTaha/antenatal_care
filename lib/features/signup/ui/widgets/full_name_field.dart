import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class FullNameField extends StatelessWidget {
  final TextEditingController nameController;
  const FullNameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return defaultForm(
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
        controller: (nameController),
        type: TextInputType.name,
        validate: (value) {
          if (value!.isEmpty) {
            return "Name Cannot Be Empty";
          }
          return null;
        },
        labeltext: "Full Name",
        prefix: Icons.person);
  }
}
