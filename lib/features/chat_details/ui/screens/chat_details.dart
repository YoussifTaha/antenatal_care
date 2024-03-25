import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:antenatal_app/features/chat_details/ui/widgets/my_message.dart';
import 'package:antenatal_app/features/chat_details/ui/widgets/other_person_message.dart';
import 'package:antenatal_app/features/chat_details/ui/widgets/send_message_bar.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatDetailsScreen extends StatefulWidget {
  final UserModel patient;
  ChatDetailsScreen({
    Key? key,
    required this.patient,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  Widget build(BuildContext context) {
    MyFirebaseFireStoreService myFirebaseFireStoreService =
        MyFirebaseFireStoreService();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: [
            SizedBox(width: 15.0),
            Text(widget.patient.fullName),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: myFirebaseFireStoreService.getMessagesCollection(
                    patientId: '${widget.patient.patientId}'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child:
                          CircularProgressIndicator(color: ColorManger.primary),
                    );
                  }
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return Text('No Messages Found');
                  }
                  var messages = snapshot.data!.docs
                      .map((doc) => MessageModel.fromJson(
                          doc.data() as Map<String, dynamic>))
                      .toList();
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToBottom();
                  });
                  return ListView.builder(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (messages[index].senderId ==
                          CacheHelper.getData(key: 'uId')) {
                        return MyMessage(model: messages[index]);
                      }
                      return OtherPersonMessage(model: messages[index]);
                    },
                    itemCount: messages.length,
                  );
                },
              ),
            ),
            verticalSpace(10),
            SendMessageBar(
              patient: widget.patient,
              messageController: messageController,
            ),
          ],
        ),
      ),
    );
  }
}
