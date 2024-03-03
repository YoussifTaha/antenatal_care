import 'package:antenatal_app/core/theming/colors.dart';
import 'package:antenatal_app/core/widgets/widgets.dart';
import 'package:antenatal_app/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          accountEmail: Text('data'),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: button(
              color: ColorManger.darkPrimary,
              context: context,
              function: () {
                HomeCubit.get(context).removeUserCache();
              },
              text: 'Sign Out'),
        )
      ],
    ));
  }
}
