import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/account_type/ui/screens/account_type_screen.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/add_new_patient.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/examination/add_examination.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history/add_history.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history_or_examination.dart';
import 'package:antenatal_app/features/chat/ui/screens/chat_screen.dart';
import 'package:antenatal_app/features/home/ui/screens/home.dart';
import 'package:antenatal_app/features/home_layout/ui/screens/home_layout.dart';
import 'package:antenatal_app/features/login/ui/screens/login_screen.dart';
import 'package:antenatal_app/features/onBoarding/ui/screens/onboarding_screen.dart';
import 'package:antenatal_app/features/patients/ui/screens/patients.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/screens/patients_info.dart';
import 'package:antenatal_app/features/signup/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case Routes.patientsScreen:
        return MaterialPageRoute(
          builder: (_) => const PatientsScreen(),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => const HomeLayout(),
        );
      case Routes.patientsInfoScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PatientsInfoCubit(),
            child: PatientsInfoScreen(),
          ),
        );
      case Routes.addBasicInfoScreen:
        return MaterialPageRoute(
          builder: (_) => AddNewPatient(),
        );
      case Routes.historyOrExaminationScreen:
        return MaterialPageRoute(
          builder: (_) => HistoryOrExamination(),
        );
      case Routes.addPatientHistoryScreen:
        return MaterialPageRoute(
          builder: (_) => AddPatientHistoryScreen(),
        );
      case Routes.addPatientExaminationScreen:
        return MaterialPageRoute(
          builder: (_) => AddPatientExaminationScreen(),
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
