import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/theming/styles_manager.dart';
import 'package:antenatal_app/features/chat/ui/screens/chat_screen.dart';
import 'package:antenatal_app/features/home/ui/screens/home.dart';
import 'package:antenatal_app/features/patients/ui/screens/patients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const PatientsScreen(),
    const ChatScreen(),
  ];

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      activeIcon: Icon(Icons.home_rounded, color: ColorManger.primary),
      icon: Icon(Icons.home_outlined, color: ColorManger.regularGrey),
      label: "Home",
    ),
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.people_alt,
        color: ColorManger.primary,
      ),
      icon: Icon(
        Icons.people_alt_outlined,
        color: ColorManger.regularGrey,
      ),
      label: "Patients",
    ),
    const BottomNavigationBarItem(
      activeIcon: Icon(Icons.chat),
      icon: Icon(Icons.chat_outlined),
      label: 'Chats',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          selectedItemColor: ColorManger.primary,
          selectedLabelStyle:
              getBoldStyle(color: ColorManger.primary, fontSize: 12.sp),
          items: bottomItems),
      body: Center(child: screens[currentIndex]),
    );
  }
}
