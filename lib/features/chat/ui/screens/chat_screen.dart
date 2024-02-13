import 'package:antenatal_app/core/Helpers/spacing.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/chat/ui/widgets/chats_list.dart';
import 'package:antenatal_app/features/chat/ui/widgets/chats_page_top_bar.dart';
import 'package:antenatal_app/features/chat/ui/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int selectedItemIndex = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chats',
          style: getBoldStyle(color: Colors.black, fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              iconSize: 30, onPressed: () {}, icon: Icon(Icons.add_box_rounded))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          verticalSpace(20),
          ChatsPageTopBar(
            pageController: pageController,
            selectedItemIndex: selectedItemIndex,
            onItemSelected: (index) {
              setState(() {
                selectedItemIndex = index;
              });
            },
          ),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        verticalSpace(20),
                        ChatScreenSearchBar(),
                        verticalSpace(20),
                        ChatsList(),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
