import 'package:antenatal_app/core/Helpers/app_regex.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
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
        controller: (phoneController),
        type: TextInputType.phone,
        validate: (value) {
          if (value!.isEmpty) {
            return "Phone Number Cannot Be Empty";
          } else if (!AppRegex.isPhoneNumberValid(value)) {
            return 'Invalid phone number';
          } else if (!AppRegex.isPhoneNumberContainsOnlyNumbers(value)) {
            return 'Phone number can only contain numbers';
          } else if (value.length != 11) {
            return "Phone number is less than 11 numbers";
          }
          return null;
        },
        labeltext: "Phone Number",
        prefix: Icons.phone_android_outlined);
  }
}
