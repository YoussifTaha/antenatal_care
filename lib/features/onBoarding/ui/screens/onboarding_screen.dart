import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'data',
        style: getBoldStyle(color: ColorManger.darkPrimary, fontSize: 30),
      )),
    );
  }
}
