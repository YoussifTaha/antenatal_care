import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  final UserModel patient;
  final String text;
  final String time;

  const ChatItem(
      {super.key,
      required this.patient,
      required this.text,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              backgroundColor: ColorManger.primary,
              foregroundColor: Colors.white,
              radius: 30,
              child: Icon(
                Icons.person,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,
                end: 3.0,
              ),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        horizontalSpace(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient.fullName,
                style: getBoldStyle(color: Colors.black, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Container(
                      width: 7.0.w,
                      height: 7.0.h,
                      decoration: BoxDecoration(
                        color: ColorManger.lightPrimary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    _formatTime(time),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatTime(String dateTimeString) {
    DateTime messageDateTime = DateTime.parse(dateTimeString);

    return '${messageDateTime.hour.toString().padLeft(2, '0')}:${messageDateTime.minute.toString().padLeft(2, '0')}';
  }
}
