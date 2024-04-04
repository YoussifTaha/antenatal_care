import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/positions/ui/widgets/positions_choice.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';

class PositionsExpandedWidget extends StatelessWidget {
  final String choice;
  final IconData icon;
  final Widget description;

  const PositionsExpandedWidget(
      {super.key,
      required this.choice,
      required this.icon,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
        initiallyExpanded: false,
        titleBuilder:
            (double animationValue, _, bool isExpaned, toogleFunction) {
          return InkWell(
              onTap: () => toogleFunction(animated: true),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: PositionsChoice(
                      animationValue: animationValue,
                      choice: choice,
                      icon: icon,
                    ),
                  ),
                ],
              ));
        },
        content: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManger.lightBackground,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
          padding: EdgeInsets.all(20),
          child: description,
        ));
  }
}
