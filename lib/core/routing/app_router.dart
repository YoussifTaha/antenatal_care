import 'package:antenatal_app/core/di/dependency_injection.dart';
import 'package:antenatal_app/core/routing/routes.dart';
import 'package:antenatal_app/features/account_type/data/repos/account_type_repo_impl.dart';
import 'package:antenatal_app/features/account_type/logic/cubit/account_type_cubit.dart';
import 'package:antenatal_app/features/account_type/ui/screens/account_type_screen.dart';
import 'package:antenatal_app/features/add_patient/data/repos/add_patient_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/examination_repos/add_examination_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/exercise_repo/exercise_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/history_repos/add_history_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/add_exercises_cubit/add_exercises_cubit.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/add_patient_cubit.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/examination_cubit/cubit/examination_cubit.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/fetch_exercises_cubit/fetch_exercises_cubit.dart';
import 'package:antenatal_app/features/add_patient/logic/cubit/history_cubit/cubit/history_cubit.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/add_new_patient.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/examination/add_examination.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/exercises/exercise_details_screen.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/exercises/exercises_screen.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history/add_history.dart';
import 'package:antenatal_app/features/add_patient/ui/screens/history_or_examination.dart';
import 'package:antenatal_app/features/chat/ui/screens/chat_screen.dart';
import 'package:antenatal_app/features/home/data/repos/home_repo_impl.dart';
import 'package:antenatal_app/features/home/logic/cubit/home_cubit.dart';
import 'package:antenatal_app/features/home/ui/screens/home.dart';
import 'package:antenatal_app/features/home_layout/ui/screens/home_layout.dart';
import 'package:antenatal_app/features/login/data/repos/login_repo_impl.dart';
import 'package:antenatal_app/features/login/logic/cubit/login_cubit.dart';
import 'package:antenatal_app/features/login/ui/screens/login_screen.dart';
import 'package:antenatal_app/features/onBoarding/ui/screens/onboarding_screen.dart';
import 'package:antenatal_app/features/patients/ui/screens/patients.dart';
import 'package:antenatal_app/features/patients_info/logic/cubit/patients_info_cubit.dart';
import 'package:antenatal_app/features/patients_info/ui/screens/patients_info.dart';
import 'package:antenatal_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:antenatal_app/features/signup/logic/cubit/signup_cubit.dart';
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
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AccountTypeCubit(locator.get<AccountTypeRepoImpl>()),
            child: AccountType(
                email: args?['email'] ?? '',
                fullName: args?['fullName'] ?? '',
                phone: args?['phone'] ?? ''),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(locator.get<LoginRepoImpl>()),
            child: LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupCubit(locator.get<SignUpRepoImpl>()),
            child: SignupScreen(),
          ),
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
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(locator.get<HomeRepoImpl>()),
            child: PatientsScreen(),
          ),
        );
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(locator.get<HomeRepoImpl>()),
            child: HomeLayout(),
          ),
        );
      case Routes.patientsInfoScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => PatientsInfoCubit(),
            child: PatientsInfoScreen(
              patientId: args?['patientId'],
            ),
          ),
        );
      case Routes.addBasicInfoScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AddPatientCubit(locator.get<AddPatientRepoImpl>()),
            child: AddNewPatient(),
          ),
        );
      case Routes.historyOrExaminationScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => HistoryOrExamination(
            patientId: args?['patientId'],
          ),
        );
      case Routes.addPatientHistoryScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                HistoryCubit(locator.get<AddHistoryRepoImpl>()),
            child: AddPatientHistoryScreen(
              patientId: args?['patientId'],
            ),
          ),
        );
      case Routes.addPatientExaminationScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ExaminationCubit(locator.get<AddExaminationRepoImpl>()),
            child: AddPatientExaminationScreen(
              patientId: args?['patientId'],
            ),
          ),
        );
      case Routes.addPatientExercisesScreen:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<FetchExercisesCubit>(
                create: (context) =>
                    FetchExercisesCubit(locator.get<ExerciseRepoImpl>()),
              ),
              BlocProvider<AddExercisesCubit>(
                create: (context) =>
                    AddExercisesCubit(locator.get<ExerciseRepoImpl>()),
              ),
            ],
            child: ExercisesScreen(
              patientId: args?['patientId'],
            ),
          ),
        );
      case Routes.addPatientExercisesScreenDetails:
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => ExerciseDetails(
            exerciseModel: args?['exerciseModel'],
          ),
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
