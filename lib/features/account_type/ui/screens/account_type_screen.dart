import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/account_type/ui/widgets/account_type_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountType extends StatefulWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  State<AccountType> createState() => _AccountTypeState();
}

String? accountType;

class _AccountTypeState extends State<AccountType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Account Type',
                style: getBoldStyle(
                    color: ColorManger.darkPrimary, fontSize: 24.sp),
              ),
              verticalSpace(10),
              Text(
                'Choose whether you are a Physiotherapist or a Female patient',
                textAlign: TextAlign.center,
                style: getRegularStyle(
                    color: ColorManger.regularGrey,
                    fontSize: 16.sp,
                    textHeight: 1.4.h),
              ),
              verticalSpace(50),
              const AccountTypeCard(
                accountType: 'doctor',
                accountTypeImagePath: 'assets/images/doctorUser.png',
                accountTypeTitle: 'Physiotherapist',
                description:
                    'Help yourself in the evaluation\nprocess with tools that make\nyou get your patients to their\noptimum recovery.',
              ),
              verticalSpace(25),
              const AccountTypeCard(
                accountType: 'patient',
                accountTypeImagePath: 'assets/images/femaleUser.png',
                accountTypeTitle: 'Female Patient',
                description:
                    'Follow up with your own \nphysiotherapist and take care \nof yourself and the baby.',
              ),
              verticalSpace(50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Note: ',
                      style: getBoldStyle(
                        color: ColorManger.darkPrimary,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextSpan(
                      text:
                          'You can’t change the account type once you’ve made it.',
                      style: getRegularStyle(
                          color: ColorManger.regularGrey,
                          fontSize: 14.sp,
                          textHeight: 1.2.h),
                    )
                  ],
                ),
              ),
              verticalSpace(20),
              button(
                  context: context,
                  function: () {
                    context.pushNamedAndRemoveUntill(Routes.homeLayout,
                        predicate: (Route<dynamic> route) => false);
                  },
                  text: 'Next')
            ],
          ),
        ),
      ),
    );
  }
}
