import 'package:antenatal_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        child: Column(
      children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: ColorManger.darkPrimary),
            currentAccountPicture: Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 60,
            ),
            accountName: Text('data'),
            accountEmail: Text('data'))
      ],
    ));
  }
}
