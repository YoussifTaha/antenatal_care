import 'package:antenatal_app/core/Helpers/extensions.dart';
import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/chat/logic/cubit/chat_cubit.dart';
import 'package:antenatal_app/features/chat/ui/widgets/chat_item.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        if (state is GetChatsLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: ColorManger.primary),
          );
        } else if (state is GetChatsSuccsses) {
          if (state.patients.isEmpty) {
            return Center(
              child: Text('No Chats Found'),
            );
          }
          return Column(
            children: [
              ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  MyFirebaseFireStoreService myFirebaseFireStoreService =
                      MyFirebaseFireStoreService();
                  UserModel model = state.patients[index];
                  return InkWell(
                    onTap: () {
                      context.pushNamed(Routes.chatDetails, arguments: {
                        'patient': model,
                      });
                    },
                    child: Column(
                      children: [
                        verticalSpace(10),
                        StreamBuilder(
                          stream:
                              myFirebaseFireStoreService.getMessagesCollection(
                                  patientId: '${model.patientId}'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                    color: ColorManger.primary),
                              );
                            } else {
                              var messages = snapshot.data!.docs
                                  .map((doc) =>
                                      MessageModel.fromJson(doc.data()))
                                  .toList();
                              return ChatItem(
                                patient: model,
                                time: messages.last.dateTime,
                                text: messages.last.text,
                              );
                            }
                          },
                        ),
                        verticalSpace(10),
                      ],
                    ),
                  );
                },
                itemCount: state.patients.length,
                separatorBuilder: (context, index) => myVerticalDivider(),
              ),
            ],
          );
        } else if (state is GetChatsError) {
          return Text(state.error);
        } else
          return Text('Unkown Error');
      },
    );
  }
}
