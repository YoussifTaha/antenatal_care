import 'package:antenatal_app/features/account_type/data/repos/account_type_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/add_patient_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/examination_repos/add_examination_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/exercise_repo/exercise_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/history_repos/add_history_repo_impl.dart';
import 'package:antenatal_app/features/home/data/repos/home_repo_impl.dart';
import 'package:antenatal_app/features/login/data/repos/login_repo_impl.dart';
import 'package:antenatal_app/features/patient_view/data/patient_view_repo_impl.dart';
import 'package:antenatal_app/features/patient_view_add_info/data/repo/patient_view_add_info_repo_impl.dart';
import 'package:antenatal_app/features/patient_view_loading-screen/data/repo/loading_screen_repo_impl.dart';
import 'package:antenatal_app/features/patients_info/data/repo/examination_repos/fetch_examination_repo_impl.dart';
import 'package:antenatal_app/features/patients_info/data/repo/exercises_repo/fetch_exercise_repo_impl.dart';
import 'package:antenatal_app/features/patients_info/data/repo/history_repos/fetch_history_repo_impl.dart';
import 'package:antenatal_app/features/post_login/data/repo/post_login_repo_impl.dart';
import 'package:antenatal_app/features/signup/data/repos/signup_repo_impl.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<SignUpRepoImpl>(SignUpRepoImpl());
  locator.registerSingleton<AccountTypeRepoImpl>(AccountTypeRepoImpl());
  locator.registerSingleton<LoginRepoImpl>(LoginRepoImpl());
  locator.registerSingleton<AddPatientRepoImpl>(AddPatientRepoImpl());
  locator.registerSingleton<AddHistoryRepoImpl>(AddHistoryRepoImpl());
  locator.registerSingleton<AddExaminationRepoImpl>(AddExaminationRepoImpl());
  locator.registerSingleton<ExerciseRepoImpl>(ExerciseRepoImpl());
  locator.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  locator
      .registerSingleton<FetchExaminationRepoImpl>(FetchExaminationRepoImpl());
  locator.registerSingleton<FetchHistoryRepoImpl>(FetchHistoryRepoImpl());
  locator.registerSingleton<FetchPatientExerciseRepoImpl>(
      FetchPatientExerciseRepoImpl());
  locator.registerSingleton<PostLoginRepoImpl>(PostLoginRepoImpl());
  locator.registerSingleton<LoadingScreenRepoImpl>(LoadingScreenRepoImpl());
  locator.registerSingleton<PatientViewAddInfoRepoImpl>(
      PatientViewAddInfoRepoImpl());
  locator
      .registerSingleton<PatientsViewInfoRepoImpl>(PatientsViewInfoRepoImpl());
}
