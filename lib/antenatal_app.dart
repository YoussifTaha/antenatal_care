import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/routing/app_router.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/core/theming/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AntenatalApp extends StatelessWidget {
  final AppRouter appRouter;
  const AntenatalApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    bool? isSignedUp = CachHelper.getData(key: 'isSignedUp');
    bool? isLogedIn = CachHelper.getData(key: 'isLogedIn');
    bool? isAccountCreated = CachHelper.getData(key: 'isAccountCreated');

    String firstScreen = Routes.onBoardingScreen;

    if ((isSignedUp != null && isAccountCreated != null) || isLogedIn != null) {
      firstScreen = Routes.homeLayout;
    } else if (isSignedUp != null && isAccountCreated == null) {
      firstScreen = Routes.accountTypeScreen;
    } else
      firstScreen = Routes.onBoardingScreen;

    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        title: 'Antenatal App',
        initialRoute: firstScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
