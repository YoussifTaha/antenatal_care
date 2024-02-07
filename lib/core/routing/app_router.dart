import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/account_type/ui/screens/account_type_screen.dart';
import 'package:antenatal_app/features/chat/ui/screens/chat_screen.dart';
import 'package:antenatal_app/features/home/ui/screens/home.dart';
import 'package:antenatal_app/features/login/ui/screens/login_screen.dart';
import 'package:antenatal_app/features/onBoarding/ui/screens/onboarding_screen.dart';
import 'package:antenatal_app/features/signup/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.accountTypeScreen:
        return MaterialPageRoute(
          builder: (_) => const AccountType(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (_) => const ChatScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for this ${settings.name}'),
            ),
          ),
        );
    }
  }
}
