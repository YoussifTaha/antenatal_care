import 'package:antenatal_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  primaryColor: ColorManger.primary,
  useMaterial3: false,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    iconTheme: IconThemeData(
      color: ColorManger.primary,
    ),
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: ColorManger.primary,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: ColorManger.primary,
      fill: 1.0,
    ),
    backgroundColor: Colors.white,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
);

// ThemeData darkTheme = ThemeData(
//   useMaterial3: false,
//   primarySwatch: Colors.deepOrange,
//   scaffoldBackgroundColor: dark,
//   appBarTheme: AppBarTheme(
//     titleSpacing: 20.0,
//     iconTheme: IconThemeData(
//       color: ColorManager.primaryOnDark,
//     ),
//     color: ColorManager.lightBlack,
//     elevation: 0.0,
//     titleTextStyle: TextStyle(
//       color: ColorManager.primaryOnDark,
//     ),
//     systemOverlayStyle: SystemUiOverlayStyle(
//       statusBarColor: ColorManager.lightBlack,
//       statusBarIconBrightness: Brightness.light,
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     unselectedIconTheme: IconThemeData(
//       color: primaryOnDark,
//     ),
//     selectedIconTheme: const IconThemeData(
//       color: Colors.deepOrange,
//       fill: 1.0,
//     ),
//     backgroundColor: ColorManager.dark,
//     elevation: 20.0,
//     type: BottomNavigationBarType.fixed,
//   ),
//   textTheme: TextTheme(
//     bodyLarge: TextStyle(
//       fontSize: 30.0,
//       fontWeight: FontWeight.bold,
//       color: ColorManager.primaryOnDark,
//     ),
//   ),
// );
