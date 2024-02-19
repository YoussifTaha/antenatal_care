import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/chat/ui/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                verticalSpace(10),
                ChatItem(),
                verticalSpace(10),
              ],
            );
          },
          itemCount: 15,
          separatorBuilder: (context, index) => myVerticalDivider(),
        ),
      ],
    );
  }
}
