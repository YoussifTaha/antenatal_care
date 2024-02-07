import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:flutter/material.dart';

class ChatScreenSearchBar extends StatelessWidget {
  const ChatScreenSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textStyle: MaterialStatePropertyAll(
          getRegularStyle(color: Colors.black, fontSize: 14)),
      leading: Row(
        children: [
          horizontalSpace(10),
          Icon(Icons.search),
        ],
      ),
      hintText: 'Search Chats',
      hintStyle: MaterialStatePropertyAll(
          getRegularStyle(color: ColorManger.regularGrey, fontSize: 14)
              .copyWith(fontStyle: FontStyle.italic)),
      backgroundColor: MaterialStatePropertyAll(ColorManger.lessLightGray),
      elevation: MaterialStatePropertyAll(0),
    );
  }
}
