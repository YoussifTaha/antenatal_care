import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
  final MessageModel model;
  const MyMessage({Key? key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManger.primary.withOpacity(.2),
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  model.text,
                  style: TextStyle(color: Colors.black87),
                ),
                SizedBox(height: 4),
                Text(
                  _formatTime(model.dateTime),
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        verticalSpace(10)
      ],
    );
  }

  String _formatTime(String dateTimeString) {
    DateTime messageDateTime = DateTime.parse(dateTimeString);

    return '${messageDateTime.hour.toString().padLeft(2, '0')}:${messageDateTime.minute.toString().padLeft(2, '0')}';
  }
}
