import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:flutter/material.dart';

class OtherPersonMessage extends StatelessWidget {
  final MessageModel model;
  const OtherPersonMessage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(
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
