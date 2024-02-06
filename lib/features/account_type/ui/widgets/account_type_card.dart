import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountTypeCard extends StatelessWidget {
  final String accountTypeTitle;
  final String description;
  final String accountTypeImagePath;
  final String accountType;
  const AccountTypeCard(
      {super.key,
      required this.accountTypeTitle,
      required this.description,
      required this.accountTypeImagePath,
      required this.accountType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 349.w,
        height: 153.h,
        decoration: ShapeDecoration(
          color: ColorManger.lightBackground,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(34),
                    Text(
                      accountTypeTitle,
                      style: getBoldStyle(
                          color: ColorManger.darkPrimary, fontSize: 18.sp),
                    ),
                    verticalSpace(5),
                    Text(
                      description,
                      style: getRegularStyle(
                          textHeight: 1.2.h,
                          color: ColorManger.regularGrey,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      accountTypeImagePath,
                      width: 116.w,
                      height: 134.h,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.radio_button_off,
                        color: ColorManger.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
