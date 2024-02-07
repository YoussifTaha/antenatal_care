import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style:
                getRegularStyle(color: ColorManger.darkPrimary, fontSize: 13),
          ),
          TextSpan(
            text: ' Sign Up',
            style: getSemiBoldStyle(color: ColorManger.primary, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
