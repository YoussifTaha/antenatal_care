import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';

import 'package:antenatal_app/features/signup/ui/widgets/signup_form.dart';
import 'package:antenatal_app/features/signup/ui/widgets/terms_and_conitions_text.dart';
import 'package:flutter/material.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(30),
                Text(
                  'Create Your Account',
                  style: getBoldStyle(color: ColorManger.primary, fontSize: 24),
                ),
                verticalSpace(8),
                Text(
                  'Enter your personal information to startusing the app whether you are a patient or a doctor',
                  style: getRegularStyle(
                      color: ColorManger.regularGrey,
                      textHeight: 1.2,
                      fontSize: 14),
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SignupForm(),
                      button(
                          context: context,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              context.pushNamed(Routes.accountTypeScreen);
                            }
                          },
                          text: 'Create Account',
                          height: 50,
                          color: ColorManger.primary,
                          fontSize: 16.sp),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
