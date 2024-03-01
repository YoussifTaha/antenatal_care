import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/features/signup/ui/widgets/confirm_password_field.dart';
import 'package:antenatal_app/features/signup/ui/widgets/email_field.dart';
import 'package:antenatal_app/features/signup/ui/widgets/full_name_field.dart';
import 'package:antenatal_app/features/signup/ui/widgets/password_field.dart';
import 'package:antenatal_app/features/signup/ui/widgets/phone_field.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const SignupForm(
      {super.key,
      required this.nameController,
      required this.phoneController,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullNameField(
          nameController: nameController,
        ),
        verticalSpace(10),
        PhoneField(
          phoneController: phoneController,
        ),
        verticalSpace(10),
        EmailField(
          emailController: emailController,
        ),
        verticalSpace(10),
        PasswordField(
          passwordController: passwordController,
        ),
        verticalSpace(10),
        ConfirmPasswordField(
          passwordController: passwordController,
          secondPasswordController: confirmPasswordController,
        ),
        verticalSpace(40),
      ],
    );
  }
}
