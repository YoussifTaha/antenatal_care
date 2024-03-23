import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  final MessageModel model;
  const MyMessage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManger.primary.withOpacity(
            .2,
          ),
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(
              10.0,
            ),
            topStart: Radius.circular(
              10.0,
            ),
            topEnd: Radius.circular(
              10.0,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 10.0,
        ),
        child: Text(
          model.text,
        ),
      ),
    );
  }
}
