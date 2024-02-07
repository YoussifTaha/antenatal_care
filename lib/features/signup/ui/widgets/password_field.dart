import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  const PasswordField({super.key, required this.passwordController});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
        controller: (widget.passwordController),
        isPassword: isPassword,
        type: TextInputType.visiblePassword,
        validate: (value) {
          if (value!.isEmpty) {
            return "Password Cannot Be Empty";
          }
          if (value.length < 6) {
            return "Password is too weak";
          }
          return null;
        },
        labeltext: "Password",
        suffixPressed: () {
          changePasswordVisibility();
          setState(() {});
        },
        suffix: suffix,
        prefix: Icons.lock);
  }
}
