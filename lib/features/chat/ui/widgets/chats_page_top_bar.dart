import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsPageTopBar extends StatefulWidget {
  final int selectedItemIndex;
  final PageController pageController;
  final ValueChanged<int> onItemSelected;
  const ChatsPageTopBar(
      {super.key,
      required this.pageController,
      required this.selectedItemIndex,
      required this.onItemSelected});

  @override
  State<ChatsPageTopBar> createState() => _ChatsPageTopBarState();
}

class _ChatsPageTopBarState extends State<ChatsPageTopBar> {
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedItemIndex = 0;
                });
                widget.pageController.animateToPage(0,
                    duration: Duration(milliseconds: 800.toInt()),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Column(
                children: [
                  Text(
                    'Antenatal',
                    style: getBoldStyle(
                        color: widget.selectedItemIndex == 0
                            ? ColorManger.primary
                            : ColorManger.regularGrey,
                        fontSize: 14.sp),
                  ),
                  verticalSpace(20),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 2,
                    height: 2.h,
                    color: widget.selectedItemIndex == 0
                        ? ColorManger.primary
                        : ColorManger.lightGray,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedItemIndex = 1;
                });
                widget.pageController.animateToPage(1,
                    duration: Duration(milliseconds: 800.toInt()),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              child: Column(
                children: [
                  Text(
                    'Postpartum',
                    style: getBoldStyle(
                        color: widget.selectedItemIndex == 0
                            ? ColorManger.regularGrey
                            : ColorManger.primary,
                        fontSize: 14.sp),
                  ),
                  verticalSpace(20),
                  Container(
                    width: MediaQuery.sizeOf(context).width / 2,
                    height: 2.h,
                    color: widget.selectedItemIndex == 0
                        ? ColorManger.lightGray
                        : ColorManger.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
