import 'package:antenatal_app/core/routing/app_router.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AntenatalApp extends StatelessWidget {
  final AppRouter appRouter;
  const AntenatalApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Antenatal App',
          initialRoute: Routes.onBoardingScreen,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}