import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:antenatal_app/features/chat_details/ui/widgets/my_message.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatelessWidget {
  ChatDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Doctor Mohamed',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  MessageModel messageModel = MessageModel(
                      senderId: '',
                      receiverId: '',
                      dateTime: 'Now',
                      text: 'Hello World');
                  return MyMessage(
                    model: messageModel,
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 15.0,
                ),
                itemCount: 5,
              ),
            ),
            Container(
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
                        // SocialCubit.get(context).sendMessage(
                        //   receiverId: userModel.uId,
                        //   dateTime: DateTime.now().toString(),
                        //   text: messageController.text,
                        // );
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
            ),
          ],
        ),
      ),
    );
  }
}
