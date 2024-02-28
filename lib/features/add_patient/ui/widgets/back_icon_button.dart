import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';

class BackIconButton extends StatelessWidget {
  final PageController pageController;
  const BackIconButton({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorManger.lightBackground,
              borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {
              pageController.previousPage(
                  duration: Duration(milliseconds: 800.toInt()),
                  curve: Curves.fastLinearToSlowEaseIn);
            },
          ),
        ),
      ],
    );
  }
}
