import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController secondPasswordController;
  const ConfirmPasswordField(
      {super.key,
      required this.passwordController,
      required this.secondPasswordController});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
  }

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
        suffixIconColor: ColorManger.primary,
        labelStyle: const TextStyle(
          color: ColorManger.primary,
        ),
        textStyle: const TextStyle(
          color: ColorManger.primary,
        ),
        controller: (widget.secondPasswordController),
        isPassword: isPassword,
        type: TextInputType.visiblePassword,
        validate: (value) {
          if (widget.secondPasswordController.text !=
              widget.passwordController.text) {
            return "Your phone numbers do not match";
          }
          if (value!.isEmpty) {
            return "Confirm Password Field Cannot Be Empty";
          }
          if (value.length < 6) {
            return '';
          }
          return null;
        },
        labeltext: "Confirm Password",
        suffixPressed: () {
          changePasswordVisibility();
          setState(() {});
        },
        suffix: suffix,
        prefix: Icons.lock);
  }
}
