import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AntenatalPatientCard extends StatelessWidget {
  const AntenatalPatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: 170.h,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: ColorManger.primary,
                            size: 60,
                          ),
                        ],
                      ),
                      horizontalSpace(10),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Menna Ahmed',
                              style: getBoldStyle(
                                  color: Colors.black, fontSize: 16.sp),
                            ),
                            verticalSpace(10),
                            Text(
                              'Age : 27 |  Occupation : House wife',
                              style: getBoldStyle(
                                  color: ColorManger.regularGrey,
                                  fontSize: 12.sp),
                            ),
                            verticalSpace(7),
                            Text(
                              'Week : 25 |  EDD :  12/3/2024',
                              style: getBoldStyle(
                                  color: ColorManger.regularGrey,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(25),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.chat_rounded,
                              color: ColorManger.primary,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            button(
                                height: 45.h,
                                context: context,
                                function: () {
                                  context.pushNamed(Routes.patientsInfoScreen);
                                },
                                text: 'View Info'),
                          ],
                        ),
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: Column(
                          children: [
                            outlinedButton(
                                height: 50.h,
                                function: () {},
                                text: 'Add Exercises'),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
