import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/chat/logic/cubit/chat_cubit.dart';
import 'package:antenatal_app/features/chat/ui/widgets/chat_item.dart';
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
                  return Column(
                    children: [
                      verticalSpace(10),
                      ChatItem(
                        patient: state.patients[index],
                      ),
                      verticalSpace(10),
                    ],
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
