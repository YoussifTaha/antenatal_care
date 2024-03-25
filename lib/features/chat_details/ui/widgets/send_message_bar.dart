import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/chat/logic/cubit/chat_cubit.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:antenatal_app/features/chat_details/logic/cubit/chats_details_cubit.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';

class SendMessageBar extends StatelessWidget {
  final UserModel patient;
  final TextEditingController messageController;
  const SendMessageBar(
      {super.key, required this.patient, required this.messageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(
          15.0,
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: TextFormField(
                controller: messageController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'type your message here ...',
                ),
              ),
            ),
          ),
          Container(
            height: 50.0,
            color: ColorManger.primary,
            child: MaterialButton(
              onPressed: () {
                ChatCubit.get(context).addNewChat(patient: patient);
                MessageModel message = MessageModel(
                  dateTime: DateTime.now().toString(),
                  senderId: CacheHelper.getData(key: 'uId'),
                  text: messageController.text,
                );
                ChatsDetailsCubit.get(context).addMessage(
                    message: message, patientId: '${patient.patientId}');

                messageController.clear();
              },
              minWidth: 1.0,
              child: Icon(
                Icons.send,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
