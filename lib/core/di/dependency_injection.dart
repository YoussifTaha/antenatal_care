import 'package:antenatal_app/features/account_type/data/repos/account_type_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/add_patient_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/examination_repos/add_examination_repo_impl.dart';
import 'package:antenatal_app/features/add_patient/data/repos/history_repos/add_history_repo_impl.dart';
import 'package:antenatal_app/features/home/data/repos/home_repo_impl.dart';
import 'package:antenatal_app/features/login/data/repos/login_repo_impl.dart';
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
  locator.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
}
